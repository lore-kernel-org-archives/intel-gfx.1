Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A41C98338
	for <intel-gfx@archiver.kernel.org>; Sat, 26 Sep 2026 15:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AA810E12D;
	Sat, 26 Sep 2026 15:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cP+pnXWw";
	dkim-atps=neutral
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F9810E029
 for <intel-gfx@lists.freedesktop.org>; Sat, 26 Sep 2026 10:16:42 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c20ce3c118aso259518766b.0
 for <intel-gfx@lists.freedesktop.org>; Sat, 26 Sep 2026 03:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790417801; cv=none;
 d=google.com; s=arc-20260327;
 b=KX40Q8zvzZAsLqTCsf4Y4GUWcIBELZHDBrJ9QbsmIN5BGAs0EFYaR7p/tYCbgnP8nI
 641ukpUh/XtOOGJLElRK00aB/uQ/zNKX81ERMgEh4idU1rf5Z5+p29jKNFOz/s+Wo+d1
 tUSJOm3nNQbYXYktG0cTBFKuwxRFAszYZb0Q/lmlJttJM/eqRbCmvkEhtmBGnQOlobAA
 pGeu0klzAnyN9SMAUki+NlzfMxJskqi5Q5i9Z3iOJJIZxkUdnuZepT6PKxpCBnLAj5FX
 JG7gzv/AtBQsws4M1OO0pIpw4nVzAUuc345nOA4qvb2tgYFOLhou2P1JVUWiCioYobFQ
 indQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
 fh=A0OT3j1YM/391ApLV4Kfi0Oz+P9aZSFBuOG0VWtuqg0=;
 b=IUhr2jT2/KpT3dPE3QTBJxr97IyXDUlCy/aB2AHFVOEpvJ2/FYWj4LuA2UKc32Df7k
 C84fgHtD/qUU+8uDyyXBbugMzbCOhfoiS7ucTceeZhqAF1NVJfQvesCeJ7sje4Ae7oxW
 WgCIjBJiMkmnXdvFDQOzIUBYq7lLeBwcewH5Cs/uuxf2j0ccpiYymSzAikfcvuNKHDy3
 KSuev98b9D/3DrchTWzucQRgmpQFon+6+RJrK1f1rgIpaYdIbTNCJncKJhQ/vitHjQm2
 YrHIBkyKzSAlrOpK2D/yITYF3a16rl48VWDIrYq5bZMaRn3o62HckBO4vgl3mZnHVTLk
 hfBA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790417801; x=1791022601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
 b=cP+pnXWw2LGFlzF7MbSmy2nmE2o2jvb5WE/g8CT041RpzHFEf6ATZ5elN2uaVO4lqT
 WVkHUhWfPUzWZhx28MrzZKl+jzEB3OreYiuHN0Diztsz3XNtpWxqZ4YLsS0VtkF8AJDm
 +lQ6gOy17FeClOkYJ7yxgJwGOKnP24TSPFARNmz452vAvDt7edzZ3fWej87r+J5fMU5r
 ybLQrhc4dkdApjLtZBbFHxDdVguR0OfwtuW09+tqGitZ85JJmd3Dm7FdiHJOk7GSmxEx
 aYgqaNn/Iv4jCzr7ZX+sb16+wV4Qg8+t73NMTbPzieETlk0/XcgazTUdphb6b4PMZrvX
 QaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790417801; x=1791022601;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nuUo8zdKSoKE11B/ziniOjON7mdE/CfW6nfGNWVjAv0=;
 b=TxSeIvHRT/y50Si3D/Ax+tDOqi1JCbc8CQ03zIO16F3Q799MhxgB/g9/4IY9rmG23c
 jfOBxuDn5Z1ZYOnhCfNDBUSKyXaemspKaORvkaOZQtqsGKN8/fzBhqJxdyMUAo9b6azI
 cWzNzVj3ZlrKiUxXYRO3GTEHyWwYjf8CONDdqNFHSfwenz/C2v0p6M6Xoj+nHPJVKdJR
 LoL95Ak0Nn9kI2ZAecCQvyGhLL1YsG5r0ZQA43kypwnpUWNCuEWAoh2njrD0dw5JKc96
 cEJg5USwrzPrNwYG3MpEKYV7wTpi7O0hE4rtKIBQ8rWJ6OFHHRZNKuGkBDfpB7j5RooU
 Q+ng==
X-Forwarded-Encrypted: i=1;
 AKwUvBw5Sx/Yi/Xd1qZOSiu+QmSR4j0kg2cQI66Jcjapr6gmMgnpzr9wphpGZEFMXJR+2M3W94N7u5oWmsg=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kVQYvd/In8mvTOnaiDuHtb3nLJ3j/UIA+2FPNIBvFI7KtJnyhH
 TUO2vseWu0X5A+OZz1LNQuRVapx8v2NLZi540WjY4hxKzqLP5OGp/uruDI6iFj/6D2pdct6Gl6d
 SxCTWeM1dE7C4pe/l9PrNmimWh+Ul+HM=
X-Gm-Gg: AYBFou2xLDVDHT8vFXRnsvdqvx9CDvJsUYr2xTsTQxz6iF2tDjou8rkLLExjx6bHKhY
 QrNezyuo59Z9ljmikNxpGJFXJNcZgeVI6s5WQ2YvGgIDWtIrJCOVLueDd5Oe9XiLkq933O8zwDl
 gVkps9Ngr+YUwHhk7ZqYDRFdktwXaW5wPZIdawWF2t8yzH6vEXriJjtQNajVYIsMTzc+TajF3Bm
 5cRqMomBiRiRAVU91uQh1jslRg0ZFCJ3GjsvStdXbkXTA1EnoWfjUYJsApe3HK4H35M5c0alNQw
 HhhfruvT3DSHXrR8vTaejvMRIW0ucTOYO5kOw1R8nut1NAGAwHlCSe8JxpmfjrurBUrHG7/l+34
 PS/2bsnMYKes=
X-Received: by 2002:a17:906:dc89:b0:c26:3341:b8f6 with SMTP id
 a640c23a62f3a-c2ac23a79a0mr705591166b.31.1790417800888; Sat, 26 Sep 2026
 03:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
In-Reply-To: <20260926045517.3458413-1-matthias.goergens@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 26 Sep 2026 18:16:03 +0800
X-Gm-Features: AclHuK-9Dsy7rrAClr-629S5BXo_K2Hom1PYuYOl9rMJseRXC4FOvcoZCXsi7Gw
Message-ID: <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Youngjun Park <youngjun.park@lge.com>, Baoquan He <baoquan.he@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
 Barry Song <baohua@kernel.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
 linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
 linux-man@vger.kernel.org, 
 Karel Zak <kzak@redhat.com>, util-linux@vger.kernel.org, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 26 Sep 2026 15:11:49 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sat, Sep 26, 2026 at 12:55=E2=80=AFPM Matthias Goergens
<matthias.goergens@gmail.com> wrote:
>
> This RFC adds offload-only swap areas for deliberate cold-page offload to
> backends unsuitable for pressure reclaim. ZFS zvol swap has documented
> deadlocks under memory pressure [3]; compressed swap is another target
> because writes may need memory despite free logical slots.
>
> Explicit proactive reclaim can use these areas alongside conventional
> swap, ordered by priority. Ordinary reclaim cannot initiate non-zero
> writes to them, including through retained swap entries. Conventional
> capacity is not reserved for emergencies. Operators choose the policy;
> the kernel does not measure headroom or make an allocating backend safe.
>
> TMO/Senpai [4] and DAMON_RECLAIM [5] are related cold-page reclaim
> approaches. This RFC admits offload-only swap through memory.reclaim and
> per-node reclaim, but not DAMON. Other related work includes per-cgroup
> zswap writeback control [6], Virtual Swap Space v4 [1] and swap tiers v10
> [2].
>
> The util-linux companion [8] proposes swapon --offload-only and an fstab
> option. Older swapon silently ignores the fstab token, so persistent
> activation needs discussion. Apply the separate i915 fix [9] first to avo=
id
> a pre-existing folio-lock leak when shmem writeback is skipped.
>
> The series fixes zram selftest device tracking and error reporting, adds
> the swap policy with DRM eligibility checks, and tests routing, workingse=
t
> activation and retained-entry write refusal. It is based on mm-new at
> 995829088503.
>
> Feedback is particularly welcome on:
>
> - Activation-time eligibility versus backend placement or migration:
>   is retained-entry refusal, with possible reclaim churn or OOM,
>   acceptable without migration?
> - Eligible-capacity accounting, including overcommit limits and OOM
>   scoring; cache recovery, cluster invalidation and workingset activation=
.
> - Persistent activation and visibility: current swap listings do not
>   expose the policy.
>
> Validation includes x86 builds, affected arm64 MTE objects and builds
> without swap or memory cgroups. QEMU tests covered routing, retained-entr=
y
> recovery, data integrity and cleanup, with negative controls for write
> refusal and teardown failure.
>
> I have also been using this policy on my own machine with experimental
> bcachefs swap support, with no problems observed so far. Deliberate stres=
s
> testing is confined to VMs; I do not deliberately stress-test this machin=
e.
>
> Changes since v1, incorporating Sashiko's public review [7]:
>
> - Improve selftest isolation, retained-swap measurement and memlock skips=
.
> - Track allocated zram devices, wait for udev probes and report cleanup
>   errors without deleting data through a mount that could not be released=
.
> - Clarify activation, capacity reporting and conventional fallback limits=
.
>
> [1] https://patchew.org/linux/20260825153238.2695446-1-nphamcs@gmail.com/
> [2] https://patchew.org/linux/20260713025644.170839-1-youngjun.park@lge.c=
om/
> [3] https://openzfs.github.io/openzfs-docs/Project%20and%20Community/FAQ.=
html#using-a-zvol-for-a-swap-device-on-linux
> [4] https://engineering.fb.com/2022/06/20/data-infrastructure/transparent=
-memory-offloading-more-memory-at-a-fraction-of-the-cost-and-power/
> [5] https://www.kernel.org/doc/html/latest/admin-guide/mm/damon/reclaim.h=
tml
> [6] https://www.kernel.org/doc/html/latest/admin-guide/mm/zswap.html
> [7] https://sashiko.dev/#/patchset/20260914104501.3960616-1-matthias.goer=
gens@gmail.com
> [8] https://github.com/util-linux/util-linux/pull/4633
> [9] https://lore.kernel.org/all/20260914105606.3997649-1-matthias.goergen=
s@gmail.com/
>
> v1: https://lore.kernel.org/all/20260914104501.3960616-1-matthias.goergen=
s@gmail.com/
>
> Matthias Goergens (4):
>   selftests: zram: track owned devices and report cleanup failures
>   mm: restrict offload-only swap to proactive reclaim
>   selftests: zram: cover offload-only swap policy
>   selftests: zram: cover retained offload-only entries
>
>  Documentation/mm/swap.rst                     | 105 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |   2 +-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |   6 +-
>  drivers/gpu/drm/msm/msm_gem_shrinker.c        |   2 +-
>  drivers/gpu/drm/panthor/panthor_gem.c         |   2 +-
>  drivers/gpu/drm/ttm/ttm_backup.c              |   2 +-
>  drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
>  include/linux/swap.h                          |  29 +-
>  include/linux/vm_event_item.h                 |   1 +
>  mm/memcontrol.c                               |  20 +-
>  mm/page_io.c                                  |  24 +-
>  mm/swapfile.c                                 | 123 ++++-
>  mm/vmscan.c                                   |  31 +-
>  mm/vmstat.c                                   |   1 +
>  tools/testing/selftests/zram/.gitignore       |   2 +
>  tools/testing/selftests/zram/Makefile         |   4 +-
>  tools/testing/selftests/zram/README           |  20 +-
>  tools/testing/selftests/zram/config           |  10 +-
>  tools/testing/selftests/zram/settings         |   1 +
>  tools/testing/selftests/zram/swap_offload.c   | 425 +++++++++++++++++
>  .../selftests/zram/workingset_offload.c       | 207 ++++++++
>  tools/testing/selftests/zram/zram.sh          |   9 +
>  tools/testing/selftests/zram/zram01.sh        |   9 +-
>  tools/testing/selftests/zram/zram02.sh        |   9 +-
>  tools/testing/selftests/zram/zram03.sh        | 174 +++++++
>  tools/testing/selftests/zram/zram04.sh        | 164 +++++++
>  tools/testing/selftests/zram/zram05.sh        | 447 ++++++++++++++++++
>  tools/testing/selftests/zram/zram_lib.sh      | 189 ++++++--
>  28 files changed, 1926 insertions(+), 94 deletions(-)

Hi Matthias

That's a lot of changes for a rather limited usage. IIUC what it want
to archive is, for different kind of reclaim, swap operations should
only go to certain devices?

This really sounds like another usage of the swap tiering design: A
default per-cgroup tier setup, and a one time tier limit during
proactive reclaim.

Just like we already have a "swappiness=3D" parameter in the reclaim
interface, perhaps adding a "swap.tier=3D" would be better and much
cleaner to achieve the same goal? Based on Youngjun's work here:
https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/
