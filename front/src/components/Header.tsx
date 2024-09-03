import Router from "next/router";

import { getCookie, deleteCookie } from "@/utils/manageCookies";

// TODO: Get token from cookie
// const accessToken = getCookie("token") || "";
const accessToken = getCookie("token");

const elements = [
  {
    title: "Management",
    href: "/manage-employees",
  },
  {
    title: "Self-Service",
    href: "/self-service",
  },
  {
    title: "Feedback",
    href: "/feedback",
  },
  {
    title: "Staff Selection",
    href: "/staff-selection",
  },
  {
    title: "Clients",
    href: "/clients",
  },
  {
    title: "Suggestions",
    href: "/suggestions",
  },
];

export function Header() {
  return (
    <header>
      <nav className="px-4 lg:px-6 py-2.5 bg-gray-800">
        <div className="flex flex-wrap justify-between items-center">
          <a href="/" className="flex items-center cursor-pointer">
            <img
              src="/silver_river_us_logo.jpeg"
              alt="Home"
              className="w-14 rounded"
            />
          </a>
          <div className="flex items-center lg:order-2">
            {accessToken && (
              <button
                onClick={() => {
                  /* TODO: deleteCookie("token") */ Router.reload();
                }}
                className="text-gray-800 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800"
              >
                Log out
              </button>
            )}
            {!accessToken && (
              <button
                onClick={() => Router.push("/login")}
                className="text-gray-800 dark:text-white hover:bg-gray-50 focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 mr-2 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800"
              >
                Log in
              </button>
            )}
          </div>
          <div
            className="hidden justify-between items-center w-full lg:flex lg:w-auto lg:order-1"
            id="mobile-menu-2"
          >
            <ul className="flex flex-col mt-4 font-medium lg:flex-row lg:space-x-8 lg:mt-0">
              {elements.map((element) => (
                <li key={element.title}>
                  <button
                    onClick={() => Router.push(element.href)}
                    className="block py-2 pr-4 pl-3 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-primary-700 lg:p-0 dark:text-gray-400 lg:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white lg:dark:hover:bg-transparent dark:border-gray-700"
                  >
                    {element.title}
                  </button>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </nav>
    </header>
  );
}
