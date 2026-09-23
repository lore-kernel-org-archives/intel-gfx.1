Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF46C98311
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Sep 2026 14:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6B110F098;
	Wed, 23 Sep 2026 14:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GkH8qfZF";
	dkim-atps=neutral
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com
 [74.125.228.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EED10EF1B
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 07:03:50 +0000 (UTC)
Received: by mail-pz2-f41.google.com with SMTP id
 d2e1a72fcca58-85469e211a3so344250b3a.2
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Sep 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790147030; x=1790751830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8rBu9v9IPDZdqktgE9+wPOf1WKfm6hYZZk7Hv5Q2JoU=;
 b=GkH8qfZF95xpELPdgPaE+p5fSJS66Loz69uL1O7QT3bBcJrhmSpbAWKm+hnWPety6o
 sUC6Mp7I6f9aGgxIYXaXSpzf19hw01dwHGbq9FbzK8rxbm0HaPMD2ttUL44LIj9UgRVt
 mj9BhgvrSnXDjJklfIc+fshZpYfe7+acl8pQ+/fsPa7ia9oUT/PdWc+z6CD3KnopYd3F
 cYqHwBhmFSuM+hb0H6W7lFFf2Km+dN8fHVqGVpDYrM7QcQst8xqJCvBze0Lu0xOwbb83
 PUS7I1+juhXCJlzuGSZ8tYoTqbDGy54XJYjUwambCtwy1iXBtuu7eoT8X1SsyPfJAoG1
 LL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790147030; x=1790751830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8rBu9v9IPDZdqktgE9+wPOf1WKfm6hYZZk7Hv5Q2JoU=;
 b=lS394e8MeqxU6/ez3eTjQMLp5JRCo01FAp1nyRmNfHaWT45NQbr1HWau2AzXjx9qko
 zOS3XUbYUCbQAQaGfIUeO8s0eePH3snfpG1TPU1AT//mQC2ovXUNtSX+S4xQ4q4tsx2h
 LdxjalZh+46TZIBEmkODt7simz85ZcCpg7cL8/bGkPJ5UNpZnRcMdTCSyIm7F4g8prnz
 SImx7OcG1lZxmYPOpBFyqPiB1SO+S9Zd6pgHJS5A3bFR9fpjHf4rowJ2m2+aAwTBAFao
 r6DIZ4rF20F20KjV4k7F/xJp9dAMT4GTbpLdKn8M+QDXbs4CcNLIu/wqXhbBWg1LjQhn
 TvDg==
X-Gm-Message-State: AFuF++kifQJhO6yO226BATZgYIGpO+By4qdiAdmd2Uk66NEYY0TEAsSL
 biAp5AjF6a3GC4eQvv0EJ+RxwPdbfFzWmMUiXme1YMki35YBGTRLqOwg
X-Gm-Gg: AYBFou3ALVSSiQ+1JgiVHIMXBXkPilcENM2nDjgm7DOmJ4Vae/ytdc5VY6Pvbed+hNh
 jlBRDAhZ+MwdcYD66JRFsJI1AlOJU9raD189WD+0CKYUPeSmqvHgJJNZ0S7J2JCPo6Vg1JPwPya
 cssSoh/7Ga9MmaNcDLWqa9JYrYT320RY+zn8xtIwGntiKxoXcVGxZBmyrm7P1URQs7XG7VIyjOV
 xNjZpneSTalwmImT6xybJnngtscTwBGziOhGOujeZbk3v0folWpDM3m+i3YEvAysufU5rRTIX3v
 VSWfmRKJ+Qu142x+XChtknw0ME0POgGoyNEWKLfbFwyK8DBUIpFCf1CYCKZavn5K+N2ZGkQTdH6
 y2g8sqJRblEJ/SRdRscHtb3X9gunfZpCYo0RX4N1gfeTlTvo++TbLPvAWDT56yah1aJM5keGMOk
 wYyshIk2p27zAnHiSNuWnHVKo65NoSsDyyUhirjPpSy6wOrxWagZk2539sIxP6FVR2As4vn+BDP
 ugf5tOsbM7QoJqw6KiboD2hmj5CnueIcBde2fxpNnx1gbQIrdoww3kTyU7GV45ERyY0HjhLmguz
 q+y9zY7NDGYYbkPllfabQbx+AhgpcZxwnl/eXMBZDp2lyx1DRDBuxKq9zelCrA==
X-Received: by 2002:a05:6a00:7705:b0:87d:6df6:103 with SMTP id
 d2e1a72fcca58-87d6df605a6mr697117b3a.34.1790147029958; 
 Wed, 23 Sep 2026 00:03:49 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87d1e5fb67fsm802939b3a.58.2026.09.23.00.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 00:03:49 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: unlock shmem folios after skipped writeback
Date: Wed, 23 Sep 2026 15:03:45 +0800
Message-ID: <179014701977.1658553.14126788544517221490.unlock@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914105606.3997649-1-matthias.goergens@gmail.com>
References: <20260914105606.3997649-1-matthias.goergens@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Sep 2026 14:17:21 +0000
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

A gentle ping on this fix. CI appears to have stopped because my address
isn't on the allowlist; could a project owner trigger a retest?

https://patchwork.freedesktop.org/series/174153/

I'd also appreciate review when someone has a chance.

Thanks,
Matthias
