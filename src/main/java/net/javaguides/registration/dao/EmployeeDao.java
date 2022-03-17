package net.javaguides.registration.dao;

import net.javaguides.registration.model.Employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployeeDao {
	public int registerEmployee(final Employee employee) throws ClassNotFoundException {
        final String INSERT_USERS_SQL = "INSERT INTO employee  (mis, first, last, birth, contact, jobrole,bonus) VALUES  (?, ?, ?, ?, ?,?,?)";
        int result = 0;
        Class.forName("com.mysql.jdbc.Driver");
        try {Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/employees", "root", "Aman@123");
        				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
                        preparedStatement.setString(1, employee.getMis());
                        preparedStatement.setString(2, employee.getFirst());
                        preparedStatement.setString(3, employee.getLast());
                        preparedStatement.setString(4, employee.getContact());
                        preparedStatement.setString(5, employee.getBirth());
                        preparedStatement.setString(6, employee.getJobrole());
                        preparedStatement.setString(7, employee.getBonus());
                        System.out.println(preparedStatement);
                        result = preparedStatement.executeUpdate();
                    }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
            }

