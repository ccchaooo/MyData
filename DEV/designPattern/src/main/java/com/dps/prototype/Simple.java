package com.dps.prototype;

import java.util.List;

/**
 * @author dengchao
 * @date 2018/12/1 22:39
 * 如果要克隆就必须实现Cloneable接口
 */
public class Simple implements Cloneable{

        private String name;
        private String sex;
        private List<String> list;
        public String getName() {
            return name;
        }
        public void setName(String name) {
            this.name = name;
        }
        public String getSex() {
            return sex;
        }
        public void setSex(String sex) {
            this.sex = sex;
        }
        public List<String> getList() {
            return list;
        }
        public void setList(List<String> list) {
            this.list = list;
        }
        //可能会抛出不支持克隆异常，原因是没有实现Cloneable接口
        @Override
        protected Simple clone(){
            try{
                return (Simple) super.clone();
            }catch(CloneNotSupportedException e){
                e.printStackTrace();
                return null;
            }
        }
}
