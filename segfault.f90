!> \file    segfault.f90
!! \author  Scott Wales (scott.wales@unimelb.edu.au)
!! \brief   A program that segfaults
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

module modsegfault
contains
subroutine setup(a, b)
    real, intent(inout) :: a(:), b(:)

    a(1) = 5
    b(1:5) = 10
end subroutine

subroutine run(times, rundata)
    integer, intent(in) :: times
    real, intent(inout) :: rundata(:)

    integer :: i

    do i=1,times
        rundata(i) = rundata(i-1) * i
    end do
end subroutine
end module

program segfault
    use modsegfault
    real, allocatable :: unallocated(:)
    real, allocatable :: rundata(:)

    allocate(rundata(5))
    call setup(unallocated, rundata)
    call run(6, rundata)

    ! Should be 10, 20, 40, etc.
    write(*,*) rundata

    deallocate(unallocated)
    deallocate(rundata)
end program
