package kr.co.honorsville.common;

import java.util.List;
import java.util.Map; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell; 
import org.apache.poi.ss.usermodel.CellStyle; 
import org.apache.poi.ss.usermodel.CellType; 
import org.apache.poi.ss.usermodel.DataFormat; 
import org.apache.poi.ss.usermodel.Row; 
import org.apache.poi.ss.usermodel.Sheet; 
import org.apache.poi.ss.usermodel.Workbook; 
import org.springframework.stereotype.Component; 
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.honorsville.admin.dto.User; 

@Component("excelView") 
public class ExcelView extends AbstractXlsView {
	
    @Override
    protected void buildExcelDocument(Map<String,Object> model , Workbook workbook , HttpServletRequest request , HttpServletResponse response) throws Exception{
        
        String type = model.get("excelType").toString();
        
            
        List<User> excelList = (List<User>)model.get("excelList");
        Sheet sheet = workbook.createSheet(type);
        Row row = null;
        int rowCount = 0;
        int cellCount = 0;
        
        row = sheet.createRow(rowCount++);

        row.createCell(cellCount++).setCellValue("번호");
        row.createCell(cellCount++).setCellValue("이름");
        row.createCell(cellCount++).setCellValue("아이디");
        row.createCell(cellCount++).setCellValue("휴대전화");
        row.createCell(cellCount++).setCellValue("이메일");
        row.createCell(cellCount++).setCellValue("가입일시");
        row.createCell(cellCount++).setCellValue("우편물동의");
        row.createCell(cellCount++).setCellValue("이메일동의");
        row.createCell(cellCount++).setCellValue("SMS동의");

        for(User vo : excelList){
            row = sheet.createRow(rowCount++);
            cellCount = 0;
            row.createCell(cellCount++).setCellValue(rowCount-1);
            row.createCell(cellCount++).setCellValue(vo.getUserName());
            row.createCell(cellCount++).setCellValue(vo.getUserId());
            row.createCell(cellCount++).setCellValue(vo.getCellPhone());
            row.createCell(cellCount++).setCellValue(vo.getEmail());
            row.createCell(cellCount++).setCellValue(vo.getRegTime());
            row.createCell(cellCount++).setCellValue(vo.getMailYn());
            row.createCell(cellCount++).setCellValue(vo.getEmailYn());
            row.createCell(cellCount++).setCellValue(vo.getSmsYn());
        }
        sheet.autoSizeColumn(0);
        sheet.autoSizeColumn(1);
        sheet.autoSizeColumn(2);
        sheet.autoSizeColumn(3);
        sheet.autoSizeColumn(4);
        sheet.autoSizeColumn(5);
        sheet.autoSizeColumn(6);
    }
 

}