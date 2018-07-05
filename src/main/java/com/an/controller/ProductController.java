package com.an.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.an.entity.Product;
import com.an.entity.User;
import com.an.service.ProductService;
import com.an.utils.FileUtil;
import com.an.utils.Results;
import com.an.vo.DatatablesViewPage;

/**
 * 商品控制器
 * 
 * @author 疯狂的蜗牛君_
 *
 */
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	/**
	 * 分页查询
	 * 
	 * @param searchProductStr
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/ProductData", method = RequestMethod.GET)
	@ResponseBody
	Results ProductData(String searchProductStr, int page) {
		String searchStr = "%" + searchProductStr + "%";
		// 获取符合条件的总条数
		long total = productService.selectCount(searchStr);
		// 计算总页数
		long totalPage = total % 10 == 0 ? total / 10 : total / 10 + 1;
		// 查询当页数据
		List<Product> products = productService.findProductDataByPageAndCount(10, page, searchStr);
		DatatablesViewPage datatablesViewPage = new DatatablesViewPage(products, totalPage, total);
		return Results.ok("查询成功").put("data", datatablesViewPage);
	}

	/**
	 * 添加一个商品
	 * 
	 * @param product
	 * @return
	 */
	@RequestMapping(value = "/postProduct", method = RequestMethod.POST)
	@ResponseBody
	ModelAndView postProduct(@RequestParam("exampleInputFile") MultipartFile exampleInputFile,Product product) {
		ModelAndView modelAndView=new ModelAndView();
		if(exampleInputFile ==null || exampleInputFile.getOriginalFilename().equals("")) {
			modelAndView.addObject("info", "商品图片为空，添加失败！");
			modelAndView.setViewName("form_add_Product");
			return modelAndView;
		}
		Results results=FileUtil.uploadImage(exampleInputFile, 1);
		if ((Integer) results.get("code") == 0) {
            String img = (String) results.get("name");
            System.err.println(img);
            product.setProImg(img);
            product.setCreateDate(new Date(System.currentTimeMillis()));
    		Product product2 = productService.findByProName(product.getProName());
    		if (product2==null) {
    			int sqltype = productService.saveProduct(product);
    			if (sqltype == 1) {
    				modelAndView.addObject("info", "添加成功！");
        			modelAndView.setViewName("form_product");
        			return modelAndView; 
    			}
        		modelAndView.addObject("info", "添加失败！");
    			modelAndView.setViewName("form_add_Product");
    			return modelAndView;    			
    		}
    		modelAndView.addObject("info", "该商品名已存在，添加失败！");
			modelAndView.setViewName("form_add_Product");
			return modelAndView;
		}else {
			modelAndView.addObject("info", "图片上传失败，请稍后再试");
			modelAndView.setViewName("form_add_Product");
			return modelAndView;
		}
	}

	/**
	 * 删除商品
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	@ResponseBody
	Results deleteProduct(@RequestParam("selectFlags") String[] ids) {
		for (String id : ids) {
			int num = productService.deleteById(Integer.valueOf(id));
			if (num != 1) {
				return Results.error("删除失败");
			}
		}
		return Results.ok();
	}

	/**
	 * 查询一个商品去编辑
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getOneProduct", method = RequestMethod.GET)
	@ResponseBody
	ModelAndView getOneProduct(@RequestParam("selectFlag") String id) {
		ModelAndView modelAndView = new ModelAndView();
		Product product = productService.findById(Integer.valueOf(id));
		if (product != null) {
			modelAndView.addObject("product", product);
			modelAndView.setViewName("form_edit_product");
			return modelAndView;
		} else {
			modelAndView.addObject("info", "商品不存在");
			modelAndView.setViewName("form_product");
			return modelAndView;
		}
	}

	/**
	 * 编辑一个商品
	 * 
	 * @param product
	 * @return
	 */
	@RequestMapping(value = "/editProduct", method = RequestMethod.POST)
	@ResponseBody
	ModelAndView editProduct(Product product) {
		ModelAndView modelAndView=new ModelAndView();
		product.setCreateDate(new Date(System.currentTimeMillis()));
		int sqltype = productService.updateProduct(product);
		if (sqltype == 1) {
			modelAndView.addObject("info", "修改成功！");
			modelAndView.setViewName("form_product");
			return modelAndView;
		}
		modelAndView.addObject("info", "修改失败！");
		modelAndView.setViewName("form_edit_product");
		return modelAndView;
	}
}
