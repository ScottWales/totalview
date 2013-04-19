!> \file    helloworld.f90
!! \author  Scott Wales (scott.wales@unimelb.edu.au)
!! \brief   Hello World in Fortran 90
!! 
!! Copyright 2013 ARC Centre of Excellence for Climate System Science
!! 
!! Licensed under the Apache License, Version 2.0 (the "License");
!! you may not use this file except in compliance with the License.
!! You may obtain a copy of the License at
!! 
!!     http://www.apache.org/licenses/LICENSE-2.0
!! 
!! Unless required by applicable law or agreed to in writing, software
!! distributed under the License is distributed on an "AS IS" BASIS,
!! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
!! See the License for the specific language governing permissions and
!! limitations under the License.
!! 

program helloworld
    implicit none
    include 'mpif.h'
    integer :: rank
    integer :: ierr
    
    call MPI_Init(ierr)
    call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)

    write(*,*) "Hello World from rank: ",rank
    call MPI_Finalize(ierr)
end program
