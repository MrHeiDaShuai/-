package dao;

import java.util.ArrayList;


import java.sql.*;

import bean.*;
import util.DBUtil;

public class TypeDao {
	
	//��ȡ����ͼ�����Ϣ�����ص�ArrayList
	public ArrayList<TypeBean> get_ListInfo(){
		ArrayList<TypeBean> tag_Array=new ArrayList<TypeBean>();
		Connection conn=DBUtil.getConnectDb();
		String sql="select * from booktype";
		PreparedStatement stm=null;
		ResultSet rs=null;
		try {
			stm=conn.prepareStatement(sql);
			rs=stm.executeQuery();
			while(rs.next()) {
				TypeBean tag = new TypeBean();
				tag.setTid(rs.getInt("tid"));
				tag.setName(rs.getString("name"));
				tag_Array.add(tag);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag_Array;
	}
	
	//�޸�ͼ����Ϣ
	public void updateBookType(int tid,String name) {
		Connection conn=DBUtil.getConnectDb();
		String sql="update booktype set name=? where tid=?";
		PreparedStatement stm=null;
		try {
			stm=conn.prepareStatement(sql);
			stm.setString(1,name);
			stm.setInt(2, tid);
			stm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//���һ��ͼ����Ϣ
	public void addBookType(String name) {
		Connection conn=DBUtil.getConnectDb();
		String sql="insert into booktype(name) values(?)";
		int rs=0;
		PreparedStatement stm=null;
		try {
			stm=conn.prepareStatement(sql);
			stm.setString(1,name);
			rs=stm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//ɾ��һ��ͼ������
	public void deleteBookType(int tid) {
		Connection conn=DBUtil.getConnectDb();
		String sql="delete from booktype where tid=?";
		PreparedStatement stm=null;
		try {
			stm=conn.prepareStatement(sql);
			stm.setInt(1,tid);
			stm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
