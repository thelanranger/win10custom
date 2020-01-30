#### ========================
#### Self Elevate
#### ------------------------
    param( $elevate )
    echo $elevate
    $env:elevateString = $elevate

    #### ========================
    #### Code credit of Ben Armstrong’s Virtualization Blog
    #### https://blogs.msdn.microsoft.com/virtual_pc_guy/
    #### ========================
    # Get the ID and security principal of the current user account
    $myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
    $myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
 
    # Get the security principal for the Administrator role
    $adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
 
    # Check to see if we are currently running "as Administrator"
    if ($myWindowsPrincipal.IsInRole($adminRole))
    {
    # We are running "as Administrator" - so change the title and background color to indicate this
    #### $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
    $Host.UI.RawUI.BackgroundColor = "DarkBlue"
    clear-host
    }
    else
    {
    # We are not running "as Administrator" - so relaunch as administrator
   
    # Create a new process object that starts PowerShell

    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   
    # Specify the current script path and name as a parameter
    ####$newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"

    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";
   
    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);
   
    # Exit from the current, unelevated, process
    exit
    }
    #### ========================
    #### Elevated Function
    #### ========================
    
    $env:elevateString

    Write-Host -NoNewLine "Press any key to continue..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

    #### ========================
    #### Elevated Function
    #### ========================	
