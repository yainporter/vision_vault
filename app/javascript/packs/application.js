var componentRequireContext = require.context("components", true);
var PreactRailsUJS = require("preact_ujs");

PreactRailsUJS.useContext(componentRequireContext)
