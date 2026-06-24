Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9ABCDB471
	for <intel-gfx@archiver.kernel.org>; Wed, 24 Jun 2026 11:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FE010EE9A;
	Wed, 24 Jun 2026 11:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WF4QHQts";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EDF10EE9A
 for <intel-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782300324; x=1813836324;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=m0LGuB5FkxF5rC95tT6VWj2lo/0s5OKsb2zVG5v554c=;
 b=WF4QHQtsOPBuBkG8JfaIwvpzKPiU5YDbfwIyvKJlp85Dk9oFzgtQWQ92
 i9sK76imDsXNewno2salXyAWUtR4AD0riXKwPm07kPeRxODirXE44enlI
 w/WxFNSzlE8CC0ddeJZXXdWf2kexfvAvvxFVzY5W800o3gFwf+tVGANQj
 gEICAlNnPvb28CdOld13DDda6/Hvw5YScgduCDM7F1iYwqMVqcx+erXQZ
 HOhlzwRoAQ1QzK9O89bVsq2kCJsBxnp8CbrELOk5b0qal/F5Y0w6cpGNv
 XKcSuCleRbhsfK0YdD0/ZzFCD/BIpk+ABoygeY/fjx2DJT1+DXbmR/ghe Q==;
X-CSE-ConnectionGUID: 3Gph89AwRUecxMP7y+nL0Q==
X-CSE-MsgGUID: vj/2GZ99S7uHijigIttQ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83179436"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83179436"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:25:24 -0700
X-CSE-ConnectionGUID: fkOWmZXwQsmh7ccCZI1tXw==
X-CSE-MsgGUID: TqyTHdScRTOqgz9Z+GuXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="279978009"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.147])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 04:25:22 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260624090940.74840-1-joonas.lahtinen@linux.intel.com>
References: <20260624090940.74840-1-joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Return NULL on error in active_instance
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Martin Hodo <martin.hodo@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
To: Intel graphics driver community testing & development
 <intel-gfx@lists.freedesktop.org>
Date: Wed, 24 Jun 2026 14:25:19 +0300
Message-ID: <178230031953.112641.4817434529385736057@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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

Pushed to drm-intel-gt-next, thanks for the reviews.

Regards, Joonas
