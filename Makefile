CC=gcc
LD=gcc

OPT_LEVEL=-Ofast -march=native -flto -mavx -mfma -ffp-contract=fast -ffast-math -fomit-frame-pointer

CC_OPTS=$(OPT_LEVEL) -fPIC -Wall -Wno-unused-variable -Werror -Wfatal-errors
LD_OPTS=$(OPT_LEVEL) -lm -lc

HEADERS:=$(wildcard *.h) Makefile

.SUFFIXES:

TARGETS=mlp
all : $(TARGETS)

%.o: %.c $(HEADERS)
	$(CC) -c $< -o $@ $(CC_OPTS)

%: %.o mlp.o rand.o
	$(LD) $^ -o $@ $(LD_OPTS)

clean:
	rm -rf $(TARGETS) *.o