package com.blog.manager;

public class Admin {
		private String adminId;  //管理员账号
		
		private String passwd;   //管理员密码
		
		private String name;   //管理员名字
		
		private String tel;   //管理员联系方式

		/**
		 * @return the adminId
		 */
		public String getAdminId() {
			return adminId;
		}

		/**
		 * @param adminId the adminId to set
		 */
		public void setAdminId(String adminId) {
			this.adminId = adminId;
		}

		/**
		 * @return the passwd
		 */
		public String getPasswd() {
			return passwd;
		}

		/**
		 * @param passwd the passwd to set
		 */
		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}

		/**
		 * @return the name
		 */
		public String getName() {
			return name;
		}

		/**
		 * @param name the name to set
		 */
		public void setName(String name) {
			this.name = name;
		}

		/**
		 * @return the tel
		 */
		public String getTel() {
			return tel;
		}

		/**
		 * @param tel the tel to set
		 */
		public void setTel(String tel) {
			this.tel = tel;
		}
		
		
		
}
