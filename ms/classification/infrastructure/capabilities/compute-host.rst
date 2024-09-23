.. _`intersect:arch:ms:capability:infrastructure:computing:host_command_execution`:

Capability - Compute :: Host Command Execution
------------------------------------------------------

:Description:
   Executes an arbitrary host command on a computing system.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires:

      + :ref:`intersect:arch:ms:capability:infrastructure:computing:allocation` **OR**
        :ref:`intersect:arch:ms:capability:infrastructure:computing:batch_queue`

:Interactions:
   - Asynchronous: None
   - Command: None
   - Request-Reply: ``RunHostCommand()``, ``RunHostCommandWithOutputFiles()``

- *Request-Reply* - ``RunHostCommand()``

      + Purpose: Run a host system command with optional environment settings
        and return the exit code. No command output is captured.

      + Request Data:

         *  ``command`` (``String``) : The full command to run.

         *  ``runEnvironment`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value environment settings to use during
            command execution.

      + Reply Data:

         *  ``exitCode`` (``Integer``) : The exit status of the command.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the system command could not be run.

- *Request-Reply* - ``RunHostCommandWithOutputFiles()``

      + Purpose: Run a host system command with optional environment settings
        and return the exit code. Command output is captured in the
        given local file(s).

      + Request Data:

         *  ``command`` (``String``) : The full command to run.

         *  ``stdoutFile`` (``Filepath``) : The absolute path to a local
            file that should be used to capture the stdout of the
            command.

         *  ``stderrFile`` (``Filepath``) : The absolute path to a local
            file that should be used to capture the stderr of the
            command. If both stdout and stderr should be combined in one
            file, then ``stdoutFile`` and ``stderrFile`` should both
            refer to the same file.

         *  ``runEnvironment`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value environment settings to use during
            command execution.

      + Reply Data:

         *  ``exitCode`` (``Integer``) : The exit status of the command.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the system command could not be run.
