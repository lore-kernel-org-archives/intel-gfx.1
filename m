Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C81C9832F
	for <intel-gfx@archiver.kernel.org>; Sun, 27 Sep 2026 14:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B62810E60A;
	Sun, 27 Sep 2026 14:46:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02510E197
 for <intel-gfx@lists.freedesktop.org>; Sun, 27 Sep 2026 00:03:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DD32F60120
 for <intel-gfx@lists.freedesktop.org>; Sun, 27 Sep 2026 00:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92BF1F0089B
 for <intel-gfx@lists.freedesktop.org>; Sun, 27 Sep 2026 00:03:24 +0000 (UTC)
Received: by mail-ej2-f43.google.com with SMTP id
 a640c23a62f3a-c2af7721e4aso202769266b.1
 for <intel-gfx@lists.freedesktop.org>; Sat, 26 Sep 2026 17:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBy+cN2eijCFEMe1a2oP3x/UxjseKwwHZYIXr6IGUZBr4hVf1Ud/I0M2mgre/I8T3faJKDbARWEn7RI=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kzGPmX8abrq9QG+LaWK4XJ7rhSm9RVxYvNy0W4BXSwqyHLYuRi
 nRjxj0XTX6RANJ2Bt1qBCFrFUf8xSH85i1d8UD7T1IRm7LiophlKhXjKUWhMrxa5vNiOVUgByw2
 txTCegAHfHDN2Dq/DG2zTDJKM34cLPHR8VwMfBgsthg==
X-Received: by 2002:a17:907:970f:b0:c28:e01d:1d08 with SMTP id
 a640c23a62f3a-c2ac268a3b6mr767904866b.49.1790467402757; Sat, 26 Sep 2026
 17:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
 <CACePvbWPLegjMtF4jYN4+_1ZeoEuBHwZuwNyMpYwPZaA0edO5A@mail.gmail.com>
In-Reply-To: <CACePvbWPLegjMtF4jYN4+_1ZeoEuBHwZuwNyMpYwPZaA0edO5A@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sat, 26 Sep 2026 14:03:11 -1000
X-Gmail-Original-Message-ID: <CACePvbU_6o_9fEFU6TJ9VaZ=4yBsDG5qXcxFkrGHBSD69m5ZXQ@mail.gmail.com>
X-Gm-Features: AclHuK-ZyMX3KOF420HwXlAK4cpZeFQwMK0gQ_EG8K18s67LKRQ8CucrkEWbQU8
Message-ID: <CACePvbU_6o_9fEFU6TJ9VaZ=4yBsDG5qXcxFkrGHBSD69m5ZXQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kairui Song <kasong@tencent.com>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>, 
 Youngjun Park <youngjun.park@lge.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-api@vger.kernel.org, 
 Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
 Karel Zak <kzak@redhat.com>, 
 util-linux@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, 
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
X-Mailman-Approved-At: Sun, 27 Sep 2026 14:46:07 +0000
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

On Sat, Sep 26, 2026 at 1:32=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Fri, Sep 25, 2026 at 6:55=E2=80=AFPM Matthias Goergens
> <matthias.goergens@gmail.com> wrote:
> > The series fixes zram selftest device tracking and error reporting, add=
s
> > the swap policy with DRM eligibility checks, and tests routing, working=
set
> > activation and retained-entry write refusal. It is based on mm-new at
> > 995829088503.
>
> Hi Matthias,
>
> I can't find mm-new 995829088503 anymore.
>
> Your patch does not apply cleanly to the current tip of mm-new
> mm-unstable, or mm-stable branches.
> Do you have a git repo with your patch applied?

Never mind, I have the conflict resolved on mm-unstable.

Sorry I usually need to have the patch appliable to use my own review scrip=
ts.

Chris
