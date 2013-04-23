all:helloworld segfault

FC=mpif90
FFLAGS+=-O0 -g 
FFLAGS+=-warn all -warn errors

%.o:%.f90
	$(FC) $(FFLAGS) -c $< -o $@

%:%.o
	$(FC) $(LDFLAGS) $^ -o $@ $(LDLIBS)
