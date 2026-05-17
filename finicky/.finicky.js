const WORK_PROFILE_BY_HOST = {
  "Matthews-MacBook-Pro-2": "Profile 2",
  "WORK-HOSTNAME-TBD": "Default",
};

const hostname = finicky.getSystemInfo().name;
const workProfile = WORK_PROFILE_BY_HOST[hostname] ?? "Default";

export default {
  defaultBrowser: "Google Chrome",
  handlers: [
    {
      match: ["*.okta.com/*", "*.oktapreview.com/*"],
      browser: { name: "Google Chrome", profile: workProfile },
    },
  ],
};
