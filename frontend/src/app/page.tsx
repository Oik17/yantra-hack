"use client";

import { AnimatePresence, easeInOut, motion } from "framer-motion";
import "./page.module.css";
import Navbar from "@/components/navbar";
import Link from "next/link";

export default function Home() {
  return (
    <>
      <div className="h-full w-full relative">
        <AnimatePresence mode="popLayout">
          <motion.div
            key="old"
            initial={{ scale: 1, x: 0, y: 0 }}
            animate={{ scale: 10, x: 225, y: 225, opacity: 0 }}
            exit={{ scale: 10, x: 225, y: 225, opacity: 0 }}
            transition={{ duration: 2, ease: easeInOut }}
            className="absolute top-[52vh] left-[153vh] w-96 h-96 -z-50 bg-[#f4b643] rounded-full"
          ></motion.div>
        </AnimatePresence>
        <AnimatePresence mode="sync">
          <motion.div
            key="circle"
            initial={{ y: -170, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.4, ease: easeInOut, delay: 1.5 }}
            className="-top-40 -right-16 w-80 h-80 bg-[#ffa500] rounded-full absolute"
          ></motion.div>
          <Navbar />
          <span className="text-7xl mt-48 absolute left-72">
            Welcome to Smart City
          </span>
          <Link
            href="/settings"
            className="text-3xl absolute left-[37rem] mt-72"
          >
            Go to settings
          </Link>
          <motion.div
            key="circle2"
            initial={{ y: 170, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.4, ease: easeInOut, delay: 1.5 }}
            className="-left-28 -bottom-[55.5rem] w-80 h-80 bg-[#d16710] rounded-full absolute"
          ></motion.div>
        </AnimatePresence>
      </div>
    </>
  );
}
