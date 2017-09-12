package com.sports.util;

import java.util.List;
import java.util.Vector;

import org.rosuda.JRI.REXP;
import org.rosuda.JRI.RList;
import org.rosuda.JRI.Rengine;

import com.sports.dto.Ord_testDTO;
import com.sports.dto.R_testDTO;

public class RUtil {
 public double R_list(List<Ord_testDTO> list){
	 Rengine re = new Rengine(new String[] {"--vanilla"}, false, null);
	 
	 System.out.println("R 연동 ");

	 if (!re.waitForR()){
	 	System.out.println("R 연동 안되고 있어 .");
	 }
	 
	 //제대로 출력중 
	 int i=0;
	 for(Ord_testDTO qwe : list){
		
		 if(i==0){
			 re.eval("id <- c(" + qwe.getOrd_no() + ") " );
			 re.eval("name <- factor(c('"+ qwe.getOp_no() +"')) " );
			 	 
		 }
		 else{
			 re.eval("id <- c(id ," + qwe.getOrd_no() + " ) " );
			 re.eval("name <- factor(c(name , '"+ qwe.getOp_no() +"' )) " );
		 }
		 i++;
	 
	 }
	 
	 System.out.println(list.size());
	 
	 re.eval("library(arules)");
	 
	 re.eval("dtfr <- data.frame(id,name)");

	 //id별 list로 쪼갠뒤 transaction 타입 변환
	 re.eval("dt.list <- split(dtfr$name , dtfr$id)");
	 re.eval("dt.tran <- as(dt.list, 'transactions')");
	 re.eval("dt.rule <- apriori(dt.tran ,  parameter = list(support = 0.2, confidence = 0.6))");
	 // apriori알고리즘 적용후 향상도만 뽑아보기
	 re.eval("dt.ins <- inspect(dt.rule)");
	 re.eval("dt.li <- dt.ins$lift");
	 
	 REXP x =re.eval("dt.li");
	 
	 System.out.println("x.toString() : " + x.asDoubleArray());
	 
	 double[] qwe = x.asDoubleArray();
	 int s = 0;
	 for (double a : qwe){
		 s++;
		 System.out.println(s+ "번째는 :" + a + "   값 입니다  ");
	 }
	 
	System.out.println();
	
	 return 1.1;
 }
 }
