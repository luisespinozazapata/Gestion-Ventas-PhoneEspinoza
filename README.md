# Gestion Ventas PhoneEspinoza

## Project Description
This is a management system for sales in the PhoneEspinoza application.

## Installation Steps

### Cloning the Repository
1. Open your terminal or command prompt.
2. Navigate to the directory where you want to clone the repository.
3. Run the following command:
   ```
   git clone https://github.com/luisespinozazapata/Gestion-Ventas-PhoneEspinoza.git
   ```

### Java Requirements
- Ensure you have JDK 8 or higher installed. You can download it from [Oracle's website](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).
- To check if Java is installed, run:
   ```
   java -version
   ```

### Setting Up MySQL
1. Download and install MySQL from [MySQL's official site](https://dev.mysql.com/downloads/mysql/).
2. Create a new MySQL database for the project:
   ```sql
   CREATE DATABASE phone_espinoza;
   ```
3. Import the SQL scripts located in the `sql` directory to set up the required tables and data.

### Eclipse Configuration
1. Open Eclipse and select File > Import.
2. Choose "Existing Maven Projects" and point to the cloned repository directory.
3. Click "Finish" to import the project.
4. Make sure to add the required libraries and any specific configurations needed for the application.

## Usage
- To run the application, execute the main class from your IDE or from the terminal using Maven:
   ```
   mvn spring-boot:run
   ```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.