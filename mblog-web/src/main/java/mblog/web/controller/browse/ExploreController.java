/**
 * 
 */
package mblog.web.controller.browse;

import java.awt.print.Book;
import java.util.List;

import mblog.core.pojos.Mblog;
import mblog.core.service.MblogService;
import mblog.web.controller.BaseController;
import mtons.commons.pojos.Paging;

import org.hibernate.Query;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.SearchFactory;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author langhsu
 *
 */
@Controller
@RequestMapping("/browse")
public class ExploreController extends BaseController {
	@Autowired
	private MblogService mblogService;
	
	@RequestMapping("/explore")
	public String view(Integer pageNo, ModelMap model) {
		Paging paging = wrapPaging(pageNo);
		mblogService.paging(paging);
		model.put("paging", paging);
		return "/browse/explore";
	}
	
}
