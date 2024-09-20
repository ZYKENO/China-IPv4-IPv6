#!/bin/bash

# اجرای اسکریپت پایتون برای تولید آدرس‌های IP
python3 << END
import random
import ipaddress

# محدوده آی‌پی‌های نسل ۶ برای چین
China_ipv6_ranges = [
    "2001:df0:9c0::/48",  # یک نمونه محدوده آی‌پی برای چین
]

# محدوده آی‌پی‌های نسل ۴ برای چین
China_ipv4_ranges = [
    "150.242.248.0/22",  # یک نمونه محدوده آی‌پی برای چین
]

def generate_random_ipv6():
    selected_range = random.choice(China_ipv6_ranges)
    network = ipaddress.IPv6Network(selected_range)
    random_address = ipaddress.IPv6Address(network.network_address + random.randint(0, network.num_addresses - 1))
    return str(random_address)

def generate_random_ipv4():
    selected_range = random.choice(China_ipv4_ranges)
    network = ipaddress.IPv4Network(selected_range)
    random_address = ipaddress.IPv4Address(network.network_address + random.randint(0, network.num_addresses - 1))
    return str(random_address)

# تولید ۲۰ آی‌پی
ipv6_addresses = [generate_random_ipv6() for _ in range(20)]
ipv4_addresses = [generate_random_ipv4() for _ in range(20)]

print("IPv6 Addresses for China:")
for address in ipv6_addresses:
    print(address)

print("\nIPv4 Addresses for China:")
for address in ipv4_addresses:
    print(address)
END
