package com.jacksonsexchangeagency.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jacksonsexchangeagency.dao.ItemDAO;
import com.jacksonsexchangeagency.model.Item;

@WebServlet("/add_item")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "uploadFiles";
    private ItemDAO itemDAO = new ItemDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve item details from the request parameters
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String condition = request.getParameter("condition");
        String owner = request.getParameter("owner");

        // Handle file upload
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }

        String fileName = null;
        for (Part part : request.getParts()) {
            String submittedFileName = part.getSubmittedFileName();
            if (submittedFileName != null && !submittedFileName.isEmpty()) {
                fileName = new File(submittedFileName).getName();
                part.write(savePath + File.separator + fileName);
            }
        }

        String photoUrl = SAVE_DIR + "/" + fileName;

        // Create an Item object
        Item item = new Item(0, name, description, category, condition, owner, photoUrl);

        // Add the item to the database
        itemDAO.addItem(item);

        // Redirect back to the browse listings page
        response.sendRedirect(request.getContextPath() + "/browseListings");
    }
}
