Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3523CA5FA1
	for <intel-gfx@archiver.kernel.org>; Tue, 29 Sep 2026 12:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED46710E191;
	Tue, 29 Sep 2026 12:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kZVKtMVh";
	dkim-atps=neutral
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com
 [74.125.227.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A207310EADF
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 15:19:55 +0000 (UTC)
Received: by mail-pj2-f12.google.com with SMTP id
 d9443c01a7336-2d747ec6188so14819715ad.3
 for <intel-gfx@lists.freedesktop.org>; Mon, 28 Sep 2026 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790608795; x=1791213595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EQrjkRZQeuYzERNWt13KrmtO7dHmdt8dryvfZkIliO0=;
 b=kZVKtMVhN8B0ZkD9XMpY3N/eULHLeJ70BNKh8cOlulOGwRB0J5pRkyd1p+KgQeRKE6
 KbvKvXz2eC5jWzqhi8C+3u0zbK77iSfOSKk4ojs6BKeTQjTp8eRgR0p/7/qSRHcpMcEN
 ttuknoVDeYc+nK8j2J9dHPkljvXjGHe4h05TnOjd+inEwTEZR2UabgulDA7duwduKCiq
 A9V3SggbFXv6vASa1wwTl2vCgc1zysPptojPsL4G9B3IYV/oV2s/80tu/xtG/BHzfCKs
 Dj39cJ3c3F63gwzaTYEuU4I+SwZR0PSJ9i9x6nDovYrd1M8uLBfyt2giv8w6b/+pQV5X
 NvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790608795; x=1791213595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EQrjkRZQeuYzERNWt13KrmtO7dHmdt8dryvfZkIliO0=;
 b=WILlglhed0f5O66GiIOD4rASm1+/QSHlP8xmT2A00qGUj+SV0w0pZJMyUM1bhf88Yz
 cX7X8JLpFcSes0jPhCRaNtCE4Qvq2g41p6hBKRLnnW6oyOVmhfT/O39YlkvHgBESR2qB
 ttYIIm7Qx4P2tadUnigIYBx6DkIUCaiihyhPkiHQoq7T7OPkuMcxF/BMAK/Tl4aZ6Kpz
 LXvbZpG8dJY26X4+kqAp8Nkx7DHMn2abM/pFpGy7ufIqcsqifEbhIjJ4bTVjXwuz3+dj
 A5pPGjKsjWB3GTuR9gTgjl0Yj5E9BsZvm0HepfWVpGx7AXr9ncBsHTa61c2PtXewu+Dy
 obPw==
X-Forwarded-Encrypted: i=1;
 AKwUvByfZcO36Za8CjjYg3T62bfIw+ecx/tN9bQXKj3O+4A+rzvs7GEzYqJPUVIY4J/lXW7lGkiVkXPTywo=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJKOy1csSnIDyvW/rHTZWB44Kdw91tGCJlU24ItTabc8TuOzq/L
 Zn9cdZUS81LQa/0hoZ4Q6pQS3Fg7OzqlKA/0u7bZb0jmldv97+8KZbUI
X-Gm-Gg: AYBFou0YClobtTB68M6xrwoHN1zxekWWLVuwkbCzY1rVwh3XK/M+TOXkV5lQndmWrn7
 2Bn6rUB5uGHvIgiTeLR5UhJTVjpc/5etuCV9O9F0dKtoQ2yqMWlsjPzfVPeAiZBayWbHn8DJSQM
 zSyoqjHCf8uKqul8AtveJoCoz8ZJ1iRwS18L3Qfeo5NyczJg+aztJeLRDND+Ymh8KJdXjNLDFIx
 vYVVQ4ivesRIbYEzH3uoQQxmh09wg1sNxwhaWwjwY7PfNAOcWji4hHE8AeCDRm5FsEcWJZ38A+1
 hzIx6et0jk6876MLN8OD3sn9xn8c1MBW77E6djFAO6Ac44VrTYJfOvNApjJYHmaRfjAhcVCKbvo
 /R1l+D33uArPJg3EXaHE1N/Kw7mu1+tlkDjFed+64AExwe29v3MReSiyTeGpfftsA/YGGrHlHB4
 dVcte+QmCg2xeo46Z3v74GSq0IA/UsSoM8fKieqveQq3DWWqg8DSmuUZqQ8EK267qie0K8d+Pii
 XlWXqiDSfYK9kkpPBmthJ5Gbn5TGFef2oMzYxOIuaDW+LkO5jxjJHqHjOHMtTmLdsPPfRb5Wa00
 CTshu1EqAW81BdAHmN6oBpyKZj+rHR6ooujK/jiOP1ZQXEvknaYEH4GYrPc=
X-Received: by 2002:a17:903:1987:b0:2dd:3ddf:b87a with SMTP id
 d9443c01a7336-2df7da68a41mr101388085ad.0.1790608794891; 
 Mon, 28 Sep 2026 08:19:54 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df91423df7sm43558615ad.43.2026.09.28.08.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 08:19:54 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, Baoquan He <baoquan.he@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Yosry Ahmed <yosry@kernel.org>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
 linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>,
 util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Kairui Song <kasong@tencent.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
Date: Mon, 28 Sep 2026 23:19:44 +0800
Message-ID: <20260928151944.2686626-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
 <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Sep 2026 12:54:31 +0000
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

Hi Kairui,

> Just like we already have a "swappiness=" parameter in the reclaim
> interface, perhaps adding a "swap.tier=" would be better and much
> cleaner to achieve the same goal? Based on Youngjun's work here:
> https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/

Thanks, I think that's the right base.  I tried it: on top of
Youngjun's v11, a "swap.tier=" argument to memory.reclaim is about 40
lines.  In a VM with zram at a higher priority than a disk swap
device, and a cgroup whose tier mask allowed only the disk, ordinary
reclaim in that cgroup stayed on the disk, while memory.reclaim with
"swap.tier=" pointing at zram went to zram only.

What it doesn't cover yet is reclaim outside any configured cgroup:
under global pressure, a cgroup nobody configured still reached the
zram tier.  So for v3 I'd like to add a system-wide limit on which
tiers pressure reclaim may use, on top of the per-cgroup settings.
I'll wait for Youngjun's v12 and build on that.

Thanks,
Matthias
