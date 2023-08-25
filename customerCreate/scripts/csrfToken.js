sap.ui.define([], function () {
  "use strict";

  return function () {
    return new Promise(function (resolve, reject) {
      var userName = "t_apattar@iffco.com";

      var password = "Iffco@31";

      let serviceUrl = "/sap/opu/odata/sap/ZSB_CLAP_BINDING";

      var oModel = new sap.ui.model.odata.v2.ODataModel(serviceUrl, {
        user: userName,

        password: password,
      });

      oModel.refreshSecurityToken(
        function (data, response) {
          var csrfToken = response.headers["x-csrf-token"];

          resolve(csrfToken);
        },

        function (error) {
          console.error("Error fetching CSRF token:", error);

          reject(csrfToken);
        }
      );
    });
  };
});
