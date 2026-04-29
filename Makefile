# choose your compiler, e.g. gcc/clang
# example override to clang: make run CC=clang
CC = gcc

# the most basic way of building that is most likely to work on most systems
.PHONY: x86
x86: run.c
	$(CC) -O3 -static -march=x86-64 -o run run.c -lm
	$(CC) -O3 -static -march=x86-64 -o runq runq.c -lm

.PHONY: x86_omp
x86_omp: run.c
	$(CC) -Ofast -fopenmp -static -march=x86-64 run.c  -lm  -o run_omp
	$(CC) -Ofast -fopenmp -static -march=x86-64 runq.c  -lm  -o runq_omp

.PHONY: arm64
arm64: run.c
	$(CC) -O3 -static -march=armv8-a -o run run.c -lm
	$(CC) -O3 -static -march=armv8-a -o runq runq.c -lm

.PHONY: arm64_omp
arm64_omp: run.c
	$(CC) -Ofast -fopenmp -static -march=armv8-a run.c  -lm  -o run_omp
	$(CC) -Ofast -fopenmp -static -march=armv8-a runq.c  -lm  -o runq_omp

.PHONY: output
output: run run_omp
	cp ./run /output
	cp ./run_omp /output

.PHONY: clean
clean:
	rm -f run
	rm -f runq
