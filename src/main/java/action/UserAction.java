package action;

import dao.DBDao;
import model.User;
import model.Login;
import util.MailUtil;

import java.sql.SQLException;
import java.util.UUID;

public class UserAction {
    /**
     * Register
     * @param user
     * @throws SQLException
     */
    public void register(User user) throws SQLException {
        DBDao dao = new DBDao();
        // generate the UUID code for representing the account state
        String code = String.valueOf(UUID.randomUUID());
        user.setCode(code);
        dao.userRegister(user);
        dao.addLog(dao.getU(user.getUser_name()), "addFriend", " Registered account.");
        // create a new thread for
        new Thread(new MailUtil(user.getEmail(), code)).start();
    }

    /**
     * Login
     * @param user
     * @throws SQLException
     */
    public Login login(User user) throws SQLException {
        DBDao dao = new DBDao();
        Login l = new Login();
        User u = dao.getUser(user);
        String s = dao.userLogin(user);
        l.setState(s);
        l.setUser(u);
        return l;
    }
}
