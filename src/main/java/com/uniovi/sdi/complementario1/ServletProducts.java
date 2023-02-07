package com.uniovi.sdi.complementario1;

import com.uniovi.sdi.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;

@WebServlet(name = "ProductsServlet", value = "/products")
public class ServletProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        List<Product> storeProducts = (List<Product>) request.getSession().getAttribute("storeProducts");

        if (storeProducts == null) {
            storeProducts = getProducts();
            request.getSession().setAttribute("storeProducts", storeProducts);
        }

        // Retornar la vista con parámetro "storeProducts"
        request.setAttribute("storeProducts", storeProducts);
        getServletContext().getRequestDispatcher("/complementario1/products-view.jsp").forward(request, response);
    }

    public List<Product> getProducts() {
        List<Product> products = new LinkedList<Product>();
        ObjectContainer db = null;
        try {
            db = Db4oEmbedded.openFile("bdProducts");
            List<Product> response = db.queryByExample(Product.class);
            // NO RETORNAR LA MISMA LISTA DE LA RESPUESTA
            products.addAll(response);
        } finally {
            db.close();
        }
        return products;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
