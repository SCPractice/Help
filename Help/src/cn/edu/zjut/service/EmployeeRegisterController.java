/*受雇者注册Service*/
package cn.edu.zjut.service;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;

import org.apache.struts2.ServletActionContext;

import com.teetaa.util.FaceAlignment;
import com.teetaa.util.Facerecognition;
import com.opensymphony.xwork2.ActionContext;
import com.teetaa.util.MD5;
import com.teetaa.util.SendMail;

import cn.edu.zjut.po.Employee;
import cn.edu.zjut.dao.IEmployeeDAO;

public class EmployeeRegisterController implements IEmployeeRegisterController {
	private Map<String, Object> session;
	private IEmployeeDAO employeeDAO = null;

	public EmployeeRegisterController() {
	}

	public void setEmployeeDAO(IEmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	public boolean register(Employee employee) { // 注册
		// 计算年龄
		System.out.println("-----EmployeeRegisterController-----");
		ActionContext ctx= ActionContext.getContext();
		session=(Map) ctx.getSession();
		int age;
		Calendar c = Calendar.getInstance(); // 当前时间
		String birth = employee.getEmployeeIDNum().substring(6, 14);
		int birthyear = Integer.parseInt(birth.substring(0, 4));
		int nowyear = c.get(Calendar.YEAR);
		int birthmonth = Integer.parseInt(birth.substring(4, 6));
		int nowmonth = c.get(Calendar.MONTH);
		int birthdate = Integer.parseInt(birth.substring(6, 8));
		int nowdate = c.get(Calendar.DATE);
		if (birthmonth > nowmonth) 
		{
			age = nowyear - birthyear;
		} else if (birthdate > nowdate) 
		{
			age = nowyear - birthyear;
		} else 
		{
			age = nowyear - birthyear + 1;
		}
		employee.setEmployeeAge(age); // 设置年龄
		employee.setEmployeeIMG("Employee/EmployeeIMG/"+employee.getEmployeeID()+"/head.jpg");   //设置头像路径
		employee.setEmployeeFace("../../headIMG/"+employee.getEmployeeID()+".jpg");
		if (!employeeDAO.findByIDNum(employee))
		{
			System.out.println("对不起，您的身份证已经被使用过，请重新注册！");
			return false; // 验证身份证号是否被使用过
		}
		if (employeeDAO.register(employee))
		{
			System.out.println("注册成功！");
			session.put("employee", employee);
			return true;
		}
		else
		{
			System.out.println("注册失败！");
			return false;
		}
	}

	
	public boolean registerUpdate(Employee employee) {
		System.out.println("-----EmployeeRegisterUpdateController-----");
		ActionContext ctx= ActionContext.getContext();
		session=(Map) ctx.getSession();
		String email = employee.getEmployeeID()+"@zjut.edu.cn";
				//"289200105@qq.com";// 
		String content = "<a href=\"http://localhost:8080/Help/EmployeeCheck?employee.employeeID="
				+ employee.getEmployeeID() + "\">";
		String m = null;
		MD5 md5 = new MD5();
		try {
			// 对密码进行MD5加密
			m = md5.md5Encode(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		content = content + m + "</a>";
		content = content + "点击链接确认身份";
		System.out.println(content);
		try {
			SendMail.sendMessage("smtp.qq.com", "289200105@qq.com", "gloplwnovnmpcbbj", email, "邮箱验证", content,
					"text/html;charset=gb2312");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (employeeDAO.update(employee))
		{
			session.put("employee", employee);
			System.out.println("完善信息成功！");
			return true;
		}
		else
			return false;
	}

	public boolean check(String ID) {
		if (employeeDAO.changeSate(ID))
			return true;
		else
			return false;

	}

	@Override
	public boolean update(Employee employee) {
		if (employeeDAO.update(employee))
		{
			session.put("employee", employee);
			System.out.println("完善更新成功！");
			return true;
		}
		else
			return false;
	}
	/* 保存原图 */
	public static void Original(String srcImgPath, String targerPath) {
		OutputStream os = null;

		try {
			Image srcImg = ImageIO.read(new File(srcImgPath));

			BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null), srcImg.getHeight(null),
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g = buffImg.createGraphics();

			g.drawImage(srcImg, 0, 0, srcImg.getWidth(null), srcImg.getHeight(null), null);

			g.dispose();
			os = new FileOutputStream(targerPath);
			// 生成图片
			srcImg.flush();

			ImageIO.write(buffImg, "JPG", os);
			os.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != os)
					os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	@Override
	public boolean uploadface(File photo, String employeeID) {
		System.out.println("----uploadfacecontroller-----");

		String srcImgPath = photo.getAbsolutePath();// 已经包含照片名
		System.out.println(srcImgPath);
		String path=ServletActionContext.getServletContext().getRealPath("/");
		System.out.println(1);
		path =path+"..\\..\\EmployeeHeadIMG\\"+employeeID+".jpg";
		System.out.println(path);
		FaceAlignment ni = new FaceAlignment();
		System.out.println(3);
		try{
			System.out.println(1);
			int ans = ni.cutface(srcImgPath, path);
			System.out.println("ans:"+ans);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println("图片对齐完毕");
		System.out.println("上传成功！");
		return true;
	}



}
