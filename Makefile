# choose your compiler, e.g. gcc/clang
# example override to clang: make run CC=clang
CC = gcc

.PHONY: all
all: run run_omp

# the most basic way of building that is most likely to work on most systems
.PHONY: run
run: run.c
	$(CC) -O3 -static -march=x86-64 -o run run.c -lm
	$(CC) -O3 -static -march=x86-64 -o runq runq.c -lm

.PHONY: run_omp
run_omp: run.c
	$(CC) -Ofast -fopenmp -static -march=x86-64 run.c  -lm  -o run_omp
	$(CC) -Ofast -fopenmp -static -march=x86-64 runq.c  -lm  -o runq_omp

.PHONY: output
output: run run_omp
	cp ./run /output
	cp ./run_omp /output

.PHONY: clean
clean:
	rm -f run
	rm -f runq
