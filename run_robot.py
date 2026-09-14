#!/usr/bin/env python
"""
run_robot.py - Entry point de chay project robotframework-run

Vi du:
    python run_robot.py --testtype ui --env dev
    python run_robot.py --testtype ui --env staging --tags smoke
    python run_robot.py --testtype ui --env dev --parallel 4
    python run_robot.py --testtype ui --env dev --suite tests/auth/login.robot
"""

import argparse
import os
import subprocess
import sys
from datetime import datetime

try:
    import yaml
except ImportError:
    print("[ERROR] Thieu thu vien pyyaml. Chay: pip install pyyaml")
    sys.exit(1)

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
CONFIG_DIR = os.path.join(ROOT_DIR, "config")
TESTS_DIR = os.path.join(ROOT_DIR, "tests")
REPORTS_DIR = os.path.join(ROOT_DIR, "reports")

PROJECT_NAME = "Meey RobotFramework Run"
PROJECT_VERSION = "1.0.0"


def parse_args():
    parser = argparse.ArgumentParser(description="Chay Robot Framework tests")

    parser.add_argument(
        "--testtype",
        choices=["ui", "api", "all"],
        default="ui",
        help="Loai test can chay (ui/api/all)",
    )
    parser.add_argument(
        "--env",
        choices=["dev", "staging", "prod"],
        default="dev",
        help="Moi truong chay test",
    )
    parser.add_argument(
        "--tags",
        default=None,
        help="Chi chay cac test case co tag nay (vi du: smoke)",
    )
    parser.add_argument(
        "--exclude-tags",
        default=None,
        help="Bo qua cac test case co tag nay",
    )
    parser.add_argument(
        "--suite",
        default=None,
        help="Duong dan cu the toi 1 file/folder test (mac dinh chay het theo testtype)",
    )
    parser.add_argument(
        "--parallel",
        type=int,
        default=0,
        help="So process chay song song bang pabot (0 = khong dung pabot)",
    )
    parser.add_argument(
        "--headless",
        action="store_true",
        help="Ep chay browser headless, bat ke config env",
    )

    return parser.parse_args()


def load_env_config(env):
    """Doc file config/{env}.yaml va tra ve dict cac bien"""
    config_path = os.path.join(CONFIG_DIR, f"{env}.yaml")

    if not os.path.exists(config_path):
        print(f"[ERROR] Khong tim thay file config: {config_path}")
        sys.exit(1)

    with open(config_path, "r", encoding="utf-8") as f:
        config = yaml.safe_load(f) or {}

    return config


def resolve_test_target(testtype, suite):
    """Xac dinh thu muc/file test se chay"""
    if suite:
        return os.path.join(ROOT_DIR, suite)

    testtype_map = {
        "ui": TESTS_DIR,
        "api": os.path.join(TESTS_DIR, "api"),
        "all": TESTS_DIR,
    }
    return testtype_map[testtype]


def build_command(args, config):
    """Dung lenh robot hoac pabot dua tren argument va config"""
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    output_dir = os.path.join(REPORTS_DIR, f"{args.env}_{args.testtype}_{timestamp}")
    os.makedirs(output_dir, exist_ok=True)

    runner = "pabot" if args.parallel and args.parallel > 0 else "robot"
    cmd = [runner]

    if runner == "pabot":
        cmd += ["--processes", str(args.parallel)]

    cmd += [
        "--name", f"{PROJECT_NAME}",
        "--metadata", f"Env:{args.env.upper()}",
        "--metadata", f"Version:{PROJECT_VERSION}",
        "--metadata", f"TestType:{args.testtype.upper()}",
        "--outputdir", output_dir,
    ]

    # Override bien tu config/{env}.yaml, khong sua truc tiep vao variables/env.robot
    for key, value in config.items():
        cmd += ["--variable", f"{key}:{value}"]

    if args.headless:
        cmd += ["--variable", "HEADLESS:True"]

    if args.tags:
        cmd += ["--include", args.tags]

    if args.exclude_tags:
        cmd += ["--exclude", args.exclude_tags]

    target = resolve_test_target(args.testtype, args.suite)
    cmd.append(target)

    return cmd, output_dir


def main():
    args = parse_args()
    config = load_env_config(args.env)

    cmd, output_dir = build_command(args, config)

    print(f"[INFO] Moi truong     : {args.env}")
    print(f"[INFO] Loai test      : {args.testtype}")
    print(f"[INFO] Output dir     : {output_dir}")
    print(f"[INFO] Lenh thuc thi  : {' '.join(cmd)}")
    print("-" * 60)

    result = subprocess.run(cmd, cwd=ROOT_DIR)

    if result.returncode == 0:
        print(f"\n[SUCCESS] Test hoan tat. Report tai: {output_dir}")
    else:
        print(f"\n[FAILED] Test that bai (exit code {result.returncode}). Report tai: {output_dir}")

    sys.exit(result.returncode)


if __name__ == "__main__":
    main()