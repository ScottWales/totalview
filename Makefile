all:helloworld segfault

FC=mpif90
FFLAGS+=-O0 -g -traceback
FFLAGS+=-warn all -warn errors
FFLAGS+=-fpe=0

%.o:%.f90
	$(FC) $(FFLAGS) -c $< -o $@

%:%.o
	$(FC) $(LDFLAGS) $^ -o $@ $(LDLIBS)
