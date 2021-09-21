!
!>	@brief
!>  Conservative emission interpolation from one mesh to a new mesh.
!>  @details
!>   Reads emissions from a wrfchemin file and interpolates to a new mesh
!>   provided from wrfinput.
!>
!>   Contains a call for tree subroutines that completes the procedure
!> \par file_reading
!>      Reads Emission inventory and the mesh to interpolate.
!> \par conversion
!>      Computations for emissions mass conservation into the new mesh.
!> \par file_out
!>      Create output file and write results
!>   @author  Jose Agustin Garcia Reynoso
!>   @date  2012/06/20
!>   @version  3.1
!>   @copyright Universidad Nacional Autonoma de Mexico 2020
!
!	Created by Agustin Garcia on
!
!****************************************************************************
!
!  PROGRAM: Interpola
!
!  Reads emissions from a wrfchemin file and interpolates to a new mesh.
!
!****************************************************************************
program Interpola
real*8 :: t1,t2

! Variables
! all shared variables used are in vars_module
! local variables are in each subroutine
! Body of Interpola

    call cpu_time(t1)
    Call reads_emision
    call cpu_time(t2)
    print *,':::: READS_EMISION: CPU time in seconds ',t2-t1

    call cpu_time(t1)
    Call reads_grid
    call cpu_time(t2)
    print *,':::: READS_GRIDS: CPU time in seconds ',t2-t1

    call cpu_time(t1)
    Call conversion
    call cpu_time(t2)
    print *,':::: CONVERSION: CPU time in seconds ',t2-t1

    call cpu_time(t1)
    Call File_out
    call cpu_time(t2)
    print *,':::: FILE_OUT: CPU time in seconds ',t2-t1
end program Interpola

