
import { db, QueryTypes } from "../models/models.js";

export const patchRender = () => {
  return async (req, res, next) => {
    const resRender = res.render.bind(res);
    const session = req.session;
    const auth = session?.auth;
    let profile = null;
    let cart = null;

    if(auth) {
      try {
        const result = await db.query(
          `
            select id as profile_id, name, type, description
            from profiles
            where id = :profile_id;
          `,
          {
            replacements: {
              profile_id: [auth.profile_id],
            },
            type: QueryTypes.SELECT
          }
        );

        if(result.length > 0) {
          profile = result[0];
        }
      } catch (error) { }

      try {
        const result = await db.query(`
            select
              count(CI.id) as cart_items_count

            from carts as C
            inner join cart_items as CI
            on (C.id = CI.cart_id)
            where C.profile_id = :profile_id;
          `,
          {
            replacements: {
              profile_id: auth.profile_id
            },
            type: QueryTypes.SELECT
          });

        cart = result[0];
      } catch (error) { }
    }

    const patchedRender = (...args) => {
      if(args[1] === undefined) {
        args[1] = {};
      }

      Object.assign(args[1], {
        session,
        auth,
        profile,
        cart
      });
      args[1].flash = args[1].flash || {};

      return resRender(...args);
    };

    res.render = patchedRender;
    next();
  };
}
