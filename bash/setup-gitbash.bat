if EXIST %USERPROFILE%\.bash_profile  del %USERPROFILE%\.bash_profile
if EXIST %USERPROFILE%\.bash_aliases del %USERPROFILE%\.bash_aliases
if EXIST %USERPROFILE%\.dir_colors del %USERPROFILE%\.dir_colors
if EXIST %USERPROFILE%\.bashrc del %USERPROFILE%\.bashrc

SET thisdir="%~dp0"

mklink %USERPROFILE%\.bash_profile %thisdir%\bash_profile
mklink %USERPROFILE%\.bash_aliases %thisdir%\bash_aliases
mklink %USERPROFILE%\.dir_colors %thisdir%\dir_colors
mklink %USERPROFILE%\.bashrc %thisdir%\bashrc

