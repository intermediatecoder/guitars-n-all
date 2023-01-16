
import { Router } from "express";
import { QueryTypes, db } from "../models/models.js";

const router = Router();

router.get("/", async (req, res, next) => {
  return res.render("pages/dashboard/index");
});

router.all("/edit-profile", async (req, res, next) => {
  let data = null;

  if(req.method === "GET")
  {
    return res.render("pages/dashboard/edit-profile", {
      data
    });
  }
  else if(req.method === "POST")
  {
    const { name, description } = req.body;
    const { profile_id } = req.session.auth;

    try
    {
      const result = await db.query(`
          update profiles
          set name = :name, description = :description
          where id = :profile_id;
        `, 
        {
          replacements: {
            name,
            description,
            profile_id
          },
          type: QueryTypes.UPDATE
        }
      );

      data = {
        status: "success",
        message: "Profile updated.",
      }

      return res.redirect("/dashboard/edit-profile");
    }
    catch (e)
    {
      data = {
        status: "error",
        message: "Failed to update the profile.",
      }
    }

    return res.render("pages/dashboard/edit-profile", {
      data,
    });
  }

  return next();
});

router.get("/profiles", async (req, res, next) => {
  return res.render("pages/dashboard/profiles");
});


// Products

router.get("/products/list", async (req, res, next) => {
  return res.render("pages/dashboard/products/list");
});

router.get("/products/create", async (req, res, next) => {
  return res.render("pages/dashboard/products/create");
});

router.get("/products/edit", async (req, res, next) => {
  return res.render("pages/dashboard/products/edit");
});

export default router;
