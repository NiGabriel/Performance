package mypackage;

import java.sql.*;
import java.util.*;

public class UserDatabase {

    Connection con;

    public UserDatabase(Connection con) {
        this.con = con;
    }

    //Admin login
    public user logAdministrator(String email, String pass, String role) {
        user usr = null;
        try {
            String query = "select * from admin where username=? and password=? and role=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            pst.setString(3, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                usr = new user();
                usr.setId(rs.getInt("id"));
                usr.setName(rs.getString("username"));
                usr.setPassword(rs.getString("password"));
                usr.setFirstname(rs.getString("firstname"));
                usr.setLastname(rs.getString("lastname"));
                usr.setRole(rs.getString("role"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return usr;
    }

    //Supervisor login
    public user logSupervisor(String email, String pass, String role) {
        user usr = null;
        try {
            String query = "select * from supervisor where username=? and password=? and role=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            pst.setString(3, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                usr = new user();
                usr.setSid(rs.getInt("id"));
                usr.setSuname(rs.getString("username"));
                usr.setSpass(rs.getString("password"));
                usr.setSfname(rs.getString("firstname"));
                usr.setSlname(rs.getString("lastname"));
                usr.setSposition(rs.getString("position"));
                usr.setStel(rs.getString("telephone"));
                usr.setSemail(rs.getString("email"));
                usr.setSroln(rs.getString("role"));
                usr.setSdepartment(rs.getString("departmentname"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return usr;
    }

    //Staff login
    public user logStaff(String email, String pass, String role) {
        user usr = null;
        try {
            String query = "select * from staff where username=? and password=? and role=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            pst.setString(3, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                usr = new user();
                usr.setStid(rs.getInt("id"));
                usr.setStuname(rs.getString("username"));
                usr.setStpass(rs.getString("password"));
                usr.setStfname(rs.getString("firstname"));
                usr.setStlname(rs.getString("lastname"));
                usr.setStposition(rs.getString("position"));
                usr.setStdepartmentname(rs.getString("departmentname"));
                usr.setSttel(rs.getString("telephone"));
                usr.setStemail(rs.getString("email"));
                usr.setStroln(rs.getString("role"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return usr;
    }
    
    //hr login
    public user logHuman(String email, String pass, String role) {
        user usr = null;
        try {
            String query = "select * from human_resource where username=? and password=? and role=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            pst.setString(3, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                usr = new user();
                usr.setHrid(rs.getInt("id"));
                usr.setHruname(rs.getString("username"));
                usr.setHrpass(rs.getString("password"));
                usr.setHrfname(rs.getString("firstname"));
                usr.setHrlname(rs.getString("lastname"));
                usr.setHrtel(rs.getString("telephone"));
                usr.setHremail(rs.getString("email"));
                usr.setHrrole(rs.getString("role"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return usr;
    }
    
    //Admin password reset
    public user logAdministrator(String email, String role) {
        user usr = null;
        try {
            String query = "select * from admin where username=? and role=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                usr = new user();
                usr.setId(rs.getInt("id"));
                usr.setName(rs.getString("username"));
                usr.setPassword(rs.getString("password"));
                usr.setFirstname(rs.getString("firstname"));
                usr.setLastname(rs.getString("lastname"));
                usr.setRole(rs.getString("role"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return usr;
    }
    
    //Supervisor password reset
    public user logSupervisor(String email, String role) {
        user usr = null;
        try {
            String query = "select * from supervisor where email=? and role=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                usr = new user();
                usr.setSid(rs.getInt("id"));
                usr.setSuname(rs.getString("username"));
                usr.setSpass(rs.getString("password"));
                usr.setSfname(rs.getString("firstname"));
                usr.setSlname(rs.getString("lastname"));
                usr.setSposition(rs.getString("position"));
                usr.setStel(rs.getString("telephone"));
                usr.setSemail(rs.getString("email"));
                usr.setSroln(rs.getString("role"));
                usr.setSdepartment(rs.getString("departmentname"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return usr;
    }

    //Staff password reset
    public user logStaff(String email, String role) {
        user usr = null;
        try {
            String query = "select * from staff where email=? and role=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                usr = new user();
                usr.setStid(rs.getInt("id"));
                usr.setStuname(rs.getString("username"));
                usr.setStpass(rs.getString("password"));
                usr.setStfname(rs.getString("firstname"));
                usr.setStlname(rs.getString("lastname"));
                usr.setStposition(rs.getString("position"));
                usr.setStdepartmentname(rs.getString("departmentname"));
                usr.setSttel(rs.getString("telephone"));
                usr.setStemail(rs.getString("email"));
                usr.setStroln(rs.getString("role"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return usr;
    }
    
    //hr password reset
    public user logHuman(String email, String role) {
        user usr = null;
        try {
            String query = "select * from human_resource where email=? and role=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, role);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                usr = new user();
                usr.setHrid(rs.getInt("id"));
                usr.setHruname(rs.getString("username"));
                usr.setHrpass(rs.getString("password"));
                usr.setHrfname(rs.getString("firstname"));
                usr.setHrlname(rs.getString("lastname"));
                usr.setHrtel(rs.getString("telephone"));
                usr.setHremail(rs.getString("email"));
                usr.setHrrole(rs.getString("role"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return usr;
    }

    //for register user 
    public boolean saveUser(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into employee(name,email,password, role, tel, level) values(?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, user.getName());
            pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());
            pt.setString(4, user.getRole());
            pt.setString(5, user.getTel());
            pt.setString(6, user.getLevel());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }


    //insert Staff
    public boolean saveStaff(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into staff values(?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getStid());
            pt.setString(2, user.getStuname());
            pt.setString(3, user.getStpass());
            pt.setString(4, user.getStfname());
            pt.setString(5, user.getStlname());
            pt.setString(6, user.getStposition());
            pt.setString(7, user.getStdepartmentname());
            pt.setString(8, user.getSttel());
            pt.setString(9, user.getStemail());
            pt.setString(10, user.getStroln());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    //insert supervisor
    public boolean saveSupervisor(user user) {
        boolean set = false;
        
        try {
            //Insert register data to database
            String query = "insert into supervisor values(?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);

            pt.setInt(1, user.getSid());
            pt.setString(2, user.getSuname());
            pt.setString(3, user.getSpass());
            pt.setString(4, user.getSfname());
            pt.setString(5, user.getSlname());
            pt.setString(6, user.getSposition());
            pt.setString(7, user.getStel());
            pt.setString(8, user.getSemail());
            pt.setString(9, user.getSroln());
            pt.setString(10, user.getSdepartment());
            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    //insert administrator
    public boolean saveAdmin(user user) {
        boolean set = false;
        int lastlogin = 0;
        try {
            //Insert register data to database
            String query = "insert into admin values(?,?,?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getAid());
            pt.setString(2, user.getAuname());
            pt.setString(3, user.getApass());
            pt.setString(4, user.getAfirstname());
            pt.setString(5, user.getAlastname());
            pt.setString(6, user.getAposition());
            pt.setString(7, user.getArole());
            pt.setInt(8, lastlogin);

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    
    //insert human resource
    public boolean saveHuman(user user) {
        boolean set = false;
        
        try {
            //Insert human resource data to database
            String query = "insert into human_resource(id,username,password,firstname,lastname,telephone,email,role) values(?,?,?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getHrid());
            pt.setString(2, user.getHruname());
            pt.setString(3, user.getHrpass());
            pt.setString(4, user.getHrfname());
            pt.setString(5, user.getHrlname());
            pt.setString(6, user.getHrtel());
            pt.setString(7, user.getHremail());
            pt.setString(8, user.getHrrole());
            

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    //insert department
    public boolean saveDep(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into department values(?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getDpid());
            pt.setString(2, user.getDpname());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    //insert position
    public boolean savePos(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into jobposition values(?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getPid());
            pt.setString(2, user.getPname());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    //insert role
    public boolean saveRole(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into role values(?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getRolid());
            pt.setString(2, user.getRolename());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    
    //insert category
    public boolean saveCate(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into category values(?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getCatid());
            pt.setString(2, user.getCatname());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    
    //insert milestone
    public boolean saveMile(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into milestone(goal,description,target,category,inputdate,enddate,weight,departmentname) values(?,?,?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getGoal());
            pt.setString(2, user.getDescription());
            pt.setString(3, user.getTarget());
            pt.setString(4, user.getCategory());
            pt.setString(5, user.getIdate());
            pt.setString(6, user.getEdate());
            pt.setInt(7, user.getWeight());
            pt.setString(8, user.getMiledep());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    
     //insert Assigned milestone
    public boolean saveAssign(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into assignedmilestone(goal,description,target,category,inputdate,enddate,weight,staffname, departmentname) values(?,?,?,?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getAssgoal());
            pt.setString(2, user.getAssdescription());
            pt.setString(3, user.getAsstarget());
            pt.setString(4, user.getAsscategory());
            pt.setString(5, user.getAssidate());
            pt.setString(6, user.getAssedate());
            pt.setInt(7, user.getAssweight());
            pt.setString(8, user.getStaffname());
            pt.setString(9, user.getAssdepname());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    
    //insert ranking milestone
    public boolean saveRank(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into report(goal,description,target,actualachieved,weight,midyearrating,endyearrating,averageannualscore,totalpoint,category,inputdate,rankdate,staffname,departmentname,comment) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, user.getRankgoal());
            pt.setString(2, user.getRankdescription());
            pt.setString(3, user.getRanktarget());
            pt.setString(4, user.getRankachieved());
            pt.setDouble(5, user.getRankweightVal());
            pt.setDouble(6, user.getRankmidyratingVal());
            pt.setDouble(7, user.getRankendyratingVal());
            pt.setDouble(8, user.getRankaverageannualscore());
            pt.setDouble(9, user.getRanktotalpoint());
            pt.setString(10, user.getRankcategory());
            pt.setString(11, user.getRankidate());
            pt.setString(12, user.getRankdate());
            pt.setString(13, user.getRankstaffname());
            pt.setString(14, user.getRankdepname());
            pt.setString(15, user.getRankcomment());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    
    //insert fulfilled milestone
    public boolean saveFulfill(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into pendingmilestone(goal,description,target,actualachieved,weight,category,inputdate,staffname,departmentname) values(?,?,?,?,?,?,?,?,?)";


            PreparedStatement pt = this.con.prepareStatement(query);
            
            pt.setInt(1, user.getFgoal());
            pt.setString(2, user.getFdescription());
            pt.setString(3, user.getFtarget());
            pt.setString(4, user.getFachieved());
            pt.setDouble(5, user.getFweightVal());
            pt.setString(6, user.getFcategory());
            pt.setString(7, user.getFidate());
            pt.setString(8, user.getFstaffname());
            pt.setString(9, user.getFdepname());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    
    //insert feedback
    public boolean saveFeed(user user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into feedback(fid,staffname,description,date,departmentname) values(?,?,?,?,?)";


            PreparedStatement pt = this.con.prepareStatement(query);
            
            pt.setInt(1, user.getFeedid());
            pt.setString(2, user.getFeedstname());
            pt.setString(3, user.getFeeddescription());
            pt.setString(4, user.getFeeddate());
            pt.setString(5, user.getFeeddepname());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }


    //Delete data from staff table
    public static int deleteStaff(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from staff where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    //Delete data from supervisor table
    public static int deleteSupervisor(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from supervisor where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    //Delete data from administrator table
    public static int deleteAdmin(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from admin where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    //Delete data from human resource table
    public static int deleteHr(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from human_resource where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    //Delete data from department table
    public static int deleteDep(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from department where depid=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    //Delete data from position table
    public static int deletePos(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from jobposition where pid=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    //Delete data from role table
    public static int deleteRole(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from role where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    //Delete data from category table
    public static int deleteCate(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from category where id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    //Delete data from milestone table
    public static int deleteMile(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from milestone where goal=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    //Delete data from assigned milestone table
    public static int deleteAssMile(int id, String name) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from assignedmilestone where goal=? and staffname=?");
            ps.setInt(1, id);
            ps.setString(2, name);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    //Delete data from assigned milestone table by staff
    public static int deleteAssMileStaff(int id, String staffname) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from assignedmilestone where goal=? and staffname=?");
            ps.setInt(1, id);
            ps.setString(2, staffname);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    //Delete data from pending milestone table
    public static int deletePendMile(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from pendingmilestone where goal=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    //Delete data from pending milestone table by staff
    public static int deletePendMileStaff(int id, String staffname) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from pendingmilestone where goal=? and staffname=?");
            ps.setInt(1, id);
            ps.setString(2, staffname);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
     //Delete data from feedback table
    public static int deleteFeed(int id) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("delete from feedback where fid=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    //Update data of staff
    public static int updateStaff(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update staff set username=?,password=?,firstname=?,lastname=?, position=?, departmentname=?, telephone=?, email=?, role=? where id=?");

            ps.setString(1, e.getStuname());
            ps.setString(2, e.getStpass());
            ps.setString(3, e.getStfname());
            ps.setString(4, e.getStlname());
            ps.setString(5, e.getStposition());
            ps.setString(6, e.getStdepartmentname());
            ps.setString(7, e.getSttel());
            ps.setString(8, e.getStemail());
            ps.setString(9, e.getStroln());
            ps.setInt(10, e.getStid());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    //Update data of supervisor

    public static int updateSupervisor(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update supervisor set username=?, password=?, firstname=?, lastname=?, position=?, telephone=?, email=?, role=?, departmentname=? where id=?");

            ps.setString(1, e.getSuname());
            ps.setString(2, e.getSpass());
            ps.setString(3, e.getSfname());
            ps.setString(4, e.getSlname());
            ps.setString(5, e.getSposition());
            ps.setString(6, e.getStel());
            ps.setString(7, e.getSemail());
            ps.setString(8, e.getSroln());
            ps.setString(9, e.getSdepartment());
            ps.setInt(10, e.getSid());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    //Update data of administrator

    public static int updateAdmin(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update admin set username=?,password=?,firstname=?, lastname=?, position=?, role=? where id=?");

            ps.setString(1, e.getAuname());
            ps.setString(2, e.getApass());
            ps.setString(3, e.getAfirstname());
            ps.setString(4, e.getAlastname());
            ps.setString(5, e.getAposition());
            ps.setString(6, e.getArole());
            ps.setInt(7, e.getAid());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    //Update data of Human resource

    public static int updateHr(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update human_resource set username=?, password=?, firstname=?, lastname=?, telephone=?, email=?, role=? where id=?");

            ps.setString(1, e.getHruname());
            ps.setString(2, e.getHrpass());
            ps.setString(3, e.getHrfname());
            ps.setString(4, e.getHrlname());
            ps.setString(5, e.getHrtel());
            ps.setString(6, e.getHremail());
            ps.setString(7, e.getHrrole());
            ps.setInt(8, e.getHrid());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    //Update data of department
    public static int updateDep(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update department set dename=? where depid=?");

            ps.setString(1, e.getDpname());
            ps.setInt(2, e.getDpid());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
//Update data of position

    public static int updatePos(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update jobposition set pname=? where pid=?");

            ps.setString(1, e.getPname());
            ps.setInt(2, e.getPid());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    //Update data of role

    public static int updateRole(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update role set rolename=? where id=?");

            ps.setString(1, e.getRolename());
            ps.setInt(2, e.getRolid());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    //Update data of category

    public static int updateCate(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update category set catename=? where id=?");

            ps.setString(1, e.getCatname());
            ps.setInt(2, e.getCatid());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    //Update data of milestone

    public static int updateMile(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update milestone set description=?, target=?, category=?, inputdate=?, enddate=?, weight=?, departmentname=? where goal=?");

            ps.setString(1, e.getDescription());
            ps.setString(2, e.getTarget());
            ps.setString(3, e.getCategory());
            ps.setString(4, e.getIdate());
            ps.setString(5, e.getEdate());
            ps.setInt(6, e.getWeight());
            ps.setString(7, e.getMiledep());
            ps.setInt(8, e.getGoal());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    //Update data of ranked milestone

    public static int updateRankMile(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update report set actualachieved=?, weight=?, midyearrating=?, endyearrating=?, averageannualscore=?, totalpoint=?, rankdate=?, comment=? where goal=? and staffname=?");
            
            
            ps.setString(1, e.getRankachieved());
            ps.setDouble(2, e.getRankweightVal());
            ps.setDouble(3, e.getRankmidyratingVal());
            ps.setDouble(4, e.getRankendyratingVal());
            ps.setDouble(5, e.getRankaverageannualscore());
            ps.setDouble(6, e.getRanktotalpoint());
            ps.setString(7, e.getRankdate());
            ps.setString(8, e.getRankcomment());
            ps.setInt(9, e.getRankgoal());
            ps.setString(10,e.getRankstaffname());
            
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
    
    //Update data of fullfilled milestone

    public static int updateFulfillMile(user e) {
        int status = 0;
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("update pendingmilestone set actualachieved=?, inputdate=? where goal=?");
            
            
            ps.setString(1, e.getFachieved());
            ps.setString(2, e.getFidate());
            ps.setInt(3, e.getFgoal());
            
            status = ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    //get department by ID
    public static user getDepById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from department where depid=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setDpid(rs.getInt(1));
                e.setDpname(rs.getString(2));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    //get position by ID
    public static user getPosById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from jobposition where pid=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setPid(rs.getInt(1));
                e.setPname(rs.getString(2));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    //get Role by ID
    public static user getRoleById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from role where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setRolid(rs.getInt(1));
                e.setRolename(rs.getString(2));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    //get Category by ID
    public static user getCateById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from category where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setCatid(rs.getInt(1));
                e.setCatname(rs.getString(2));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    //get staff by ID
    public static user getStaffById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from staff where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setStid(rs.getInt(1));
                e.setStuname(rs.getString(2));
                e.setStpass(rs.getString(3));
                e.setStfname(rs.getString(4));
                e.setStlname(rs.getString(5));
                e.setStposition(rs.getString(6));
                e.setStdepartmentname(rs.getString(7));
                e.setSttel(rs.getString(8));
                e.setStemail(rs.getString(9));
                e.setStroln(rs.getString(10));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    //get supervisor by ID
    public static user getSupervisorById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from supervisor where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setSid(rs.getInt(1));
                e.setSuname(rs.getString(2));
                e.setSpass(rs.getString(3));
                e.setSfname(rs.getString(4));
                e.setSlname(rs.getString(5));
                e.setSposition(rs.getString(6));
                e.setStel(rs.getString(7));
                e.setSemail(rs.getString(8));
                e.setSroln(rs.getString(9));
                e.setSdepartment(rs.getString(10));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    //get Admin by ID
    public static user getAdminById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from admin where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setAid(rs.getInt(1));
                e.setAuname(rs.getString(2));
                e.setApass(rs.getString(3));
                e.setAfirstname(rs.getString(4));
                e.setAlastname(rs.getString(5));
                e.setAposition(rs.getString(6));
                e.setArole(rs.getString(7));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }
    
    //get HR by ID
    public static user getHrById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from human_resource where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setHrid(rs.getInt(1));
                e.setHruname(rs.getString(2));
                e.setHrpass(rs.getString(3));
                e.setHrfname(rs.getString(4));
                e.setHrlname(rs.getString(5));
                e.setHrtel(rs.getString(6));
                e.setHremail(rs.getString(7));
                e.setHrrole(rs.getString(8));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }
    
    //get milestone by ID
    public static user getMilestoneById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from milestone where goal=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setGoal(rs.getInt(1));
                e.setDescription(rs.getString(2));
                e.setTarget(rs.getString(3));
                e.setCategory(rs.getString(4));
                e.setIdate(rs.getString(5));
                e.setEdate(rs.getString(6));
                e.setWeight(rs.getInt(7));
                e.setMiledep(rs.getString(8));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }
    
    //get pending milestone by ID
    public static user getPendMileById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from pendingmilestone where goal=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setPendgoal(rs.getInt(1));
                e.setPenddescription(rs.getString(2));
                e.setPendtarget(rs.getString(3));
                e.setPendachieved(rs.getString(4));
                e.setPendweight(rs.getInt(5));
                e.setPendcategory(rs.getString(6));
                e.setPendidate(rs.getString(7));
                e.setStaffnamep(rs.getString(8));
                e.setPenddepname(rs.getString(9));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }
    
    //get Assigned milestone by ID
    public static user getAssMileById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from assignedmilestone where goal=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setAssgoal(rs.getInt(1));
                e.setAssdescription(rs.getString(2));
                e.setAsstarget(rs.getString(3));
                e.setAsscategory(rs.getString(4));
                e.setAssidate(rs.getString(5));
                e.setAssedate(rs.getString(6));
                e.setAssweight(rs.getInt(7));
                e.setStaffname(rs.getString(8));
                e.setAssdepname(rs.getString(9));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }
    
    //get ranked milestone by ID
    public static user getRankById(int id) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from report where goal=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setRankgoal(rs.getInt(1));
                e.setRankdescription(rs.getString(2));
                e.setRanktarget(rs.getString(3));
                e.setRankachieved(rs.getString(4));
                e.setRankweightVal(rs.getInt(5));
                e.setRankmidyratingVal(rs.getDouble(6));
                e.setRankendyratingVal(rs.getDouble(7));
                e.setRankaverageannualscore(rs.getDouble(8));
                e.setRanktotalpoint(rs.getDouble(9));
                e.setRankcategory(rs.getString(10));
                e.setRankidate(rs.getString(11));
                e.setRankdate(rs.getString(12));
                e.setRankstaffname(rs.getString(13));
                e.setRankdepname(rs.getString(14));
                e.setRankcomment(rs.getString(15));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }
    
    //get ranked milestone by ID on one staff
    public static user getRankByIdStaff(int id, String staffname) {
        user e = new user();
        try {
            Connection con = ConnectionPro.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from report where goal=? and staffname=?");
            ps.setInt(1, id);
            ps.setString(2, staffname);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setRankgoal(rs.getInt(1));
                e.setRankdescription(rs.getString(2));
                e.setRanktarget(rs.getString(3));
                e.setRankachieved(rs.getString(4));
                e.setRankweightVal(rs.getInt(5));
                e.setRankmidyratingVal(rs.getDouble(6));
                e.setRankendyratingVal(rs.getDouble(7));
                e.setRankaverageannualscore(rs.getDouble(8));
                e.setRanktotalpoint(rs.getDouble(9));
                e.setRankcategory(rs.getString(10));
                e.setRankidate(rs.getString(11));
                e.setRankdate(rs.getString(12));
                e.setRankstaffname(rs.getString(13));
                e.setRankdepname(rs.getString(14));
                e.setRankcomment(rs.getString(15));

            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    //Selet type
    public void selectType() {

        try {
            Connection con = ConnectionPro.getConnection();

            PreparedStatement pst = con.prepareStatement("select rolename from role");

            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                String name = rs.getString("rolename");
            }
        } catch (Exception e) {   // out.print(e);
        }
    }
}
