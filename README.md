# Django Boilerplate Setup Script

![Django Logo](https://www.djangoproject.com/m/img/logos/django-logo-negative.png)



## 🚀 Overview

This script streamlines the setup process for new Django projects by automatically copying essential configuration files. These files are fundamental for each project, ensuring that your development environment is properly configured from the outset. With this tool, you can quickly establish a solid foundation for your Django applications, allowing you to focus on coding rather than configuration.

## 📥 Features

- Uses the correct base URL for your GitHub repository.
- Implements error handling for both Bash and PowerShell.
- Checks for errors when creating the `.vscode` directory.
- Downloads essential files for your Django project.

## ⚙️ Usage

Run the script using the following commands:

- **On Linux/macOS**:
  ```bash
  curl -sSL l.ayushb.com/django | bash
  ```

- **On Windows**:
  ```powershell
  iwr l.ayushb.com/django | iex
  ```

## ⚠️ Important Notes

- The script will overwrite any existing files with the same names in the current directory.
- If any step fails, an error message will be displayed, and the script will exit with a non-zero status code.

## 🎉 Conclusion

This script provides a streamlined and efficient way to establish a robust foundation for your Django projects. By automating the setup of essential configuration files, it reduces the time and effort typically required for initial project configuration. With comprehensive error handling and support for both Bash and PowerShell environments, this tool ensures a smooth setup experience, allowing developers to focus on building their applications rather than getting bogged down in setup challenges. Embrace the ease of use and reliability this script offers, and jumpstart your Django development journey today!


---

### 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
