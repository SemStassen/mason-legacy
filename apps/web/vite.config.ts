import { mergeConfig } from "vite";
// Aliased imports do not work here
import baseConfig from "../../packages/config/base.vite";

export default mergeConfig(baseConfig, {
  server: {
    port: 8002,
  },
  resolve: {},
});
