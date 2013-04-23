all:helloworld segfault

FC=mpif90
FFLAGS+=-O2 -g 
FFLAGS+=-warn all -warn errors

%.o:%.f90
	$(FC) $(FFLAGS) -c $< -o $@

%:%.o
	$(FC) $(LDFLAGS) $^ -o $@ $(LDLIBS)
