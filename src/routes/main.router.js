
import express from "express";
import { db, QueryTypes } from "../models/models.js";

const mainRouter = express.Router();

mainRouter.get("/", async (req, res, next) => {
  let data = {
    status: "success",
    products: [],
    product_types: [],
  };

  try {
    const result = await db.query(`
      select * from products
      order by id
      limit 5
    `, {
      type: QueryTypes.SELECT
    });

    Object.assign(data, {
      products: result,
    });
  } catch (error) { }

  Object.assign(data, {
    product_types: [
      "Acoustic Guitars",
      "Bass Guitars",
      "Electric Guitars",
      "Effect Pedals",
      "Accessories",
    ]
  });

  return res.render("pages/index", {
    data
  });
});

mainRouter.get("/shop", async (req, res, next) => {
  try {
    const products = await db.query(`
    select P.id, P.name, P.features, P.image, SP.seller_id,
		if(count(V.id) = 0,
			json_array(),
			json_arrayagg(V.variant_name)
		) as variants,
        if(count(SP.id) = 0,
            json_array(),
			json_arrayagg(json_object('id', SP.id, 'price', price, "seller_id", seller_id))
		) as prices
      from products as P
      left join seller_products as SP
      on (P.id=SP.product_id)
      left join variants as V
      on (SP.variant_id=V.id)
      group by P.id;
    `);

    if(products.length > 0) {
      let [guitars] = products;

      return res.render("pages/shop", {
        data: {
          guitars
        }
      });
    } else {
      
    }

  } catch (error) {

  }

  return res.render("pages/shop", {
    data: {}
  });
});

mainRouter.get("/products/:id", async (req, res, next) => {
  const { id } = req.params;

  try {
    // const result = await db.query(`
    //   select id, name, description, features, image
    //   from products
    //   where id = :id`,
    const result = await db.query(`
      select P.id, P.name, P.features, P.image, P.description,
        SP.seller_id,
        if(count(V.id) = 0,
          json_array(),
          json_arrayagg(V.variant_name)
        ) as variants,
            if(count(SP.id) = 0,
                json_array(),
          json_arrayagg(json_object('id', SP.id, 'price', price, "seller_id", seller_id))
        ) as prices
      
      from products as P
      left join seller_products as SP
      on (P.id=SP.product_id)
      left join variants as V
      on (SP.variant_id=V.id)
      
      where P.id = :id
      group by P.id;`,
      {
        replacements: { id },
        type: QueryTypes.SELECT,
      }
    );

    if(result.length > 0) {
      // Product was found
      const product = result[0];

      return res.render("pages/products/product-page", {
        data: {
          product
        }
      });
    } else {
      // Product was not found
    }
  } catch (error) {

  }

  return res.render("pages/products/product-page", {
    data: {}
  });
});


mainRouter.get("/posters", async (req, res, next) => {
  const static_posters = [
    "https://imgs.search.brave.com/1RlcGleg2mWiBYHeeim6OFhUays1DNYCh6rnngPnNsg/rs:fit:1078:1200:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzgxLzkx/LzlkLzgxOTE5ZDhm/ZDY1NWZmNzI2NzBl/MDVkMTY0OGMyYmVk/LmpwZw",
    "https://imgs.search.brave.com/T0jjkT4l4kK9R13e7fyChuDMvhwAjWDfhmaZxbr_4fs/rs:fit:735:525:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vNzM2/eC9mYS9hNi83NC9m/YWE2NzRmYjI1YTY5/ZGE5OGUxOGU3NTRl/ZjNiODMwMi5qcGc",
    "https://imgs.search.brave.com/QaIYpRJn0Wi7JaQzHbm9ejWx9LarglBHbalNyIrjFtY/rs:fit:600:600:1/g:ce/aHR0cHM6Ly9ybHYu/emNhY2hlLmNvbS5h/dS90aHJlZV9jb2xv/cmVkX2d1aXRhcnNf/cG9zdGVyLXI0NTlh/NmFkOGE1OTE0MmI3/YjI4OTIzNTVlOWU2/Nzg1Ml93djRfOGJ5/dnJfNjAwLmpwZw",
    "https://imgs.search.brave.com/oLEz_4ptplvS7-cCrQtK362aoGFfRJTiMoyQkhgFY4E/rs:fit:800:1028:1/g:ce/aHR0cHM6Ly9wNy5o/aWNsaXBhcnQuY29t/L3ByZXZpZXcvNjg3/LzUzNS82MjMvZWxl/Y3RyaWMtZ3VpdGFy/LWdydW5nZS1wb3N0/ZXItdmVjdG9yLWFy/dC1ndWl0YXIuanBn",
    "https://imgs.search.brave.com/sn9jkkBqpgU0BerHb42tXk-3u3USeWzZ4V4MRzOKLgM/rs:fit:1152:1200:1/g:ce/aHR0cHM6Ly9qZW5p/ZmVyc2hvcC5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMjEv/MDUvaWxfZnVsbHhm/dWxsLjE0MDc2NDk1/NTlfcDhoZy1zY2Fs/ZWQtMS0xMTUyeDE1/MzYuanBn",
    "https://imgs.search.brave.com/oCbgky4-cKcKrrjww1OSE09I1Kb6NMpnjPVB7p_26r0/rs:fit:1125:1200:1/g:ce/aHR0cHM6Ly9kZWNv/cnlvdXJob21lLnN0/b3JlL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDE5LzExL2lsX2Z1/bGx4ZnVsbC40ODQz/MjA0MTBfaGlzMy5q/cGc",
    "https://imgs.search.brave.com/6VPidldUASCyv076Dl-TyI1v5vmqPXca1PfTCYJtVWw/rs:fit:709:709:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzc5L2Iz/LzAwLzc5YjMwMDk3/NjdiYTdlZTkzMzJj/YjYwOWMwZTE5MTZk/LmpwZw",
    "https://imgs.search.brave.com/9UqRrzskMQ0S2UrgmIwohnCkllYlWrpGIifLF5Ojb2g/rs:fit:800:534:1/g:ce/aHR0cHM6Ly9paDEu/cmVkYnViYmxlLm5l/dC9pbWFnZS4xNjMy/MzI1MS4wNTA2L2Zs/YXQsODAweDgwMCww/NzAsZi51MS5qcGc",
  ];

  return res.render("pages/posters", {
    posters: static_posters,
  });
});

mainRouter.get("/nearby-classes", async (req, res, next) => {
  return res.render("pages/nearby-classes");
})

// Logout
mainRouter.get("/logout", async (req, res, next) => {
  await req.session.destroy();

  return res.redirect("/");
});

// Login
mainRouter.get("/login", async (req, res, next) => {
  return res.render("pages/login", {
    errors: null,
  });
});

mainRouter.post("/login", async (req, res, next) => {
  const { username, password } = req.body;

  let errors = {};

  try {
    const profiles = await db.query(
      `
        select
          A.username, A.id as account_id,
          P.id as profile_id, P.name, P.type

        from accounts as A
        inner join profiles as P
        on (P.account_id = A.id)

        where username = :username AND password = :password;
      `,
      {
        replacements: {
          username,
          password,
        },
        type: QueryTypes.SELECT
      }
    );

    if(profiles.length === 0) {
      errors.message = "Invalid username/password entered.";
    } else {
      const defaultProfile = profiles[0];
      
      const auth = {
        account_id: defaultProfile.account_id,
        profile_id: defaultProfile.profile_id,
        username: defaultProfile.username,
      };

      console.log(auth);

      req.session.auth = auth;
      await req.session.save();

      return res.redirect("/");
    }
  } catch (error) {

  }

  return res.render("pages/login", {
    flash: {
      errors,
    }
  });
});



// Sign up
mainRouter.get("/signup", async (req, res, next) => {
  return res.render("pages/signup");
});

mainRouter.post("/signup", async (req, res, next) => {
  let { username, password, phone_number, name, description } = req.body;

  if(!description) {
    description = "";
  }

  let errors = {};

  const t = await db.transaction();
  let accountId, profileId;

  try {
    [accountId] = await db.query(
      `
        insert into accounts
          (username, password, phone_number, created_at, updated_at)
        values
          (:username, :password, :phone_number, now(), now());
      `,
      {
        replacements: {
          username,
          password,
          phone_number,
        },
        type: QueryTypes.INSERT,
        transaction: t,
      }
    );

    [profileId] = await db.query(
      `
        insert into profiles
          (name, description, account_id, created_at, updated_at)
        values
          (:name, :description, :account_id, now(), now());
      `,
      {
        replacements: {
          name,
          description,
          account_id: accountId,
        },
        type: QueryTypes.INSERT,
        transaction: t,
      }
    );

    [cardId] = await db.query(`
      insert into carts
        (profile_id)
      values
        (:profile_id);
      `,
      {
        replacements: {
          profile_id: profileId,
        },
        type: QueryTypes.INSERT,
        transaction: t,
      }
    );

    console.log(accountId);
    console.log(profileId);
    console.log(cardId);

    
    await t.commit();

    // Log the user in    
    const auth = {
      account_id: accountId,
      profile_id: profileId,
      username: username,
    };

    console.log(auth);

    req.session.auth = auth;
    await req.session.save();

    return res.redirect("/");

  } catch (error) {
    console.log(error);
    await t.rollback();
  }

  return res.render("pages/signup", {
    flash: {
      errors: {
        message: "Could not sign up at this moment",
      }
    }
  })
});

mainRouter.get("/about", async (req, res, next) => {
  return res.render("pages/about");
});

mainRouter.all("/payment", async (req, res, next) => {
  if(req.method === "GET")
  {
    const { type, product_id } = req.query;
    console.log(type, product_id);

    let data = {
      status: "error",
      message: "Could not load the order",
    }

    if(type === "buy_now")
    {
      try {
        // const result = await db.query(`
        //   select id, name, description, features, image
        //   from products
        //   where id = :id`,
        const result = await db.query(`
          select P.id, P.name, P.features, P.image, P.description,
            SP.seller_id,

            if(count(V.id) = 0,
              json_array(),
              json_arrayagg(V.variant_name)
            ) as variants,

            if(count(SP.id) = 0,
                json_array(),
                json_arrayagg(json_object(
                  'id', SP.id,
                  'price', price,
                  "seller_id", seller_id,
                  "seller_name", S.name,
                  "variant_id", V.id,
                  "variant_name", V.variant_name
                ))
            ) as prices
          
          from products as P
          left join seller_products as SP
          on (P.id=SP.product_id)
          left join variants as V
          on (SP.variant_id=V.id)
          left join profiles as S
          on (S.id = SP.seller_id)
          
          where P.id = :id
          group by P.id;`,
          {
            replacements: { id: product_id },
            type: QueryTypes.SELECT,
          }
        );

        if(result.length > 0) {
          // Product was found
          const product = result[0];
          data = {
            status: "success",
            product,
          }

        } else {
          // Product was not found
          data = {
            status: "error",
            message: "Product not found."
          };
        }
      } catch (error) {
        data = {
          status: "error",
          message: "Could not load product."
        };
      }
    } else {
      try {
        // const result = await db.query(`
        //   select id, name, description, features, image
        //   from products
        //   where id = :id`,
        const result = await db.query(`
          select CI.id, P.name, P.image, SP.seller_id, S.name as seller_name, SP.price, CI.quantity
          from cart_items as CI

          inner join
          carts as C
          on (C.id = CI.cart_id)

          inner join
          seller_products as SP
          on (SP.id = CI.seller_product_id)

          left join
          products as P
          on (P.id = SP.product_id)

          left join
          profiles as S
          on (S.id = SP.seller_id)

          where
          C.profile_id = :profile_id;
          `,
          {
            replacements: {
              profile_id: req.session.auth.profile_id
            },
            type: QueryTypes.SELECT,
          }
        );

        // Product was found
        const products = result;
        Object.assign(data, {
          status: "success",
          products,
        });
      } catch (error) {
        data = {
          status: "error",
          message: "Could not load product."
        };
      }
    }

    // Type of order
    Object.assign(data, {
      type
    });

    console.log(JSON.stringify(data, null, 2));

    return res.render("pages/credit", {
      data,
    });
  }
  else if(req.method === "POST")
  {
    const { type } = req.body;
    const data = {
      status: "error",
      message: "Could not place order",
    };

    if(type === "buy_now") {
      const {
        name,
        email,
        phone_no,
        address,
        pincode,
        city,
        seller_product_id,
        quantity,
      } = req.body;

      const t = await db.transaction();
      const { profile_id } = req.session.auth;

      console.log("SELLER PRODUCT ID = ", seller_product_id);

      let order_id, result;

      try {
        [order_id] = await db.query(
          `
            insert into orders
            (
              profile_id, name, email,
              phone_no, address, pincode, city
            )
            values
            (
              :profile_id, :name, :email, :phone_no,
              :address, :pincode, :city
            )
          `,
          {
            replacements: {
              profile_id,
              name,
              email,
              phone_no,
              address,
              pincode,
              city,
            },
            type: QueryTypes.INSERT,
            transaction: t,
          }
        );

        [result] = await db.query(
          `
            insert into order_items
            (
              seller_product_id,
              order_id,
              quantity
            )
            values
            (
              :seller_product_id,
              :order_id,
              :quantity
            )
          `,
          {
            replacements: {
              seller_product_id,
              order_id,
              quantity,
            },
            type: QueryTypes.INSERT,
            transaction: t,
          }
        );

        console.log("ORDER SUCCESSFUL! Order ID = ", order_id);
        
        await t.commit();

        return res.redirect("/orders?success=true");
      } catch (error) {
        console.log(error);
        await t.rollback();
      }
    }
  }
  return next();
});

mainRouter.get("/cart/add-to-cart", async (req, res, next) => {
  let { return_url } = req.query;
  return_url = return_url || "/";

  let data = {
    status: "error",
    message: "Could not place older",
  };

  try {

    const t = await db.transaction();
    const { profile_id } = req.session.auth;

    const [ order ] = await db.query(`
      select id from orders
      where profile_id = :profile_id
      `, {
        replacements: {
          profile_id,
        },
        type: QueryTypes.SELECT,
      });

    [result] = await db.query(`
        insert into order_items
        (
          seller_product_id,
          order_id,
          quantity
        )
        values
        (
          :seller_product_id,
          :order_id,
          :quantity
        )
      `,
      {
        replacements: {
          seller_product_id,
          order_id,
          quantity,
        },
        type: QueryTypes.INSERT,
        transaction: t,
      }
    );

    await t.commit();

    console.log("ORDER SUCCESSFUL! Order ID = ", order_id);
  } catch (e) {

  }

  return res.redirect(return_url);
})

mainRouter.get("/profiles/:id", async (req, res, next) => {
  const { id } = req.params;

  let data = {
    status: "error",
    message: "Could not load profile"
  };

  if(id) {
    try {
      const [ result ] = await db.query(`
          select * from profiles
          where id = :id;
        `,
        {
          replacements: { id },
          type: QueryTypes.SELECT,
        }
      );

      if(result) {
        data = {
          status: "success",
          profile: result,
        }
      }
    } catch (error) { }
  }

  return res.render("pages/profiles/index", {
    data
  });
});



mainRouter.get("/orders", async (req, res, next) => {
  if(!req.session && req.session.auth) {
    res.redirect("/");
  }

  let data = {
    status: "error",
    message: "Could not load orders",
  };

  try {
    const { profile_id } = req.session.auth;
    const result = await db.query(`
        SELECT
          O.id as order_id,
          O.name,
          O.email,
          O.phone_no,
          O.address,
          O.pincode,
          O.city,
          O.created_at,

          if(count(OI.id) = 0,
             json_array(),
             json_arrayagg(json_object(
                 'id', OI.id,
                 'seller_product_id', SP.id,
                 'product_name', P.name,
                 'quantity', OI.quantity,
                 'seller_id', S.id,
                 'seller_name', S.name,
                 'price', SP.price,
                 'variant_name', V.variant_name
             ))
          ) as items

        from orders as O

        left join
            order_items as OI
            on (O.id = OI.order_id)

        left join
          seller_products as SP
            on (SP.id = OI.seller_product_id)
            
        left join
          products as P
            on (P.id = SP.product_id)

        left join
          profiles as S
          on (S.id = SP.seller_id)

        left join
          variants as V
            on (V.id = SP.variant_id)

        where profile_id = :profile_id
        group by O.id;
        `, {
          type: QueryTypes.SELECT,
          replacements: {
            profile_id,
          }
        });
    Object.assign(data, {
      status: "success",
      orders: result,
    });
  } catch (error) {
  }

  return res.render("pages/orders", {
    data
  });
});

mainRouter.post("/api/cart/change", async (req, res, next) => {
  const { action } = req.body;

  console.log(action);
  
  if(action === "update-quantity") {
    const { cartItemId, quantity } = req.body;
    console.log(cartItemId, quantity);

    try {
      const result = await db.query(`
        update cart_items
        set quantity = :quantity
        where id = :cart_item_id;
        `,
        {
          replacements: {
            quantity,
            cart_item_id: cartItemId,
          },
          type: QueryTypes.UPDATE,
        }
      );


      if(result) {
        return res.json({
          message: "Updated quantity successfully!",
          cartItemId,
          quantity,
        })
      }
    } catch (e) {

    }
  }

  return res.json({
    error: true,
    message: "Failed to change cart"
  })
});

mainRouter.get("/cart", async (req, res, next) => {
  let data = {
    status: "error",
    message: "Could not load cart",
  };

  try {
    const result = await db.query(`
      select CI.id, P.name, P.image, SP.seller_id, S.name as seller_name, SP.price, CI.quantity
      from cart_items as CI

      inner join
      carts as C
      on (C.id = CI.cart_id)

      inner join
      seller_products as SP
      on (SP.id = CI.seller_product_id)

      left join
      products as P
      on (P.id = SP.product_id)

      left join
      profiles as S
      on (S.id = SP.seller_id)

      where
      C.profile_id = :profile_id;
      `,
      {
        replacements: {
          profile_id: req.session.auth.profile_id
        },
        type: QueryTypes.SELECT,
      }
    );

    Object.assign(data, {
      status: "success",
      cartItems: result,
    });
  } catch (error) {

  }

  return res.render("pages/cart", {
    data
  })
});

export default mainRouter;
