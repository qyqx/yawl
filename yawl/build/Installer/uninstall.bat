"$JAVA_HOME\bin\java" -jar "$INSTALL_PATH\Uninstaller\uninstaller.jar"
del /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\*.war"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\adminTool"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\JythonService"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\EmailSenderService"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\NexusServiceInvoker"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\timeService"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\workletService"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\worklist"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\yawlSMSInvoker"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\yawlWSInvoker"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\yawlXForms"
rmdir /S /Q "c:\program files\apache software foundation\tomcat 5.5\webapps\yawl"
