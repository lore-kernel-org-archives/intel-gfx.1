Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8ADEF8FF9
	for <intel-gfx@archiver.kernel.org>; Wed,  4 Mar 2026 14:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C4910EA2D;
	Wed,  4 Mar 2026 14:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEwVScGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0A410E190;
 Wed,  4 Mar 2026 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772636073; x=1804172073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VrF3V6m8Ww1+Hs1QIH6Ob6wH6pHl7M9QdgSP9yDxYFw=;
 b=YEwVScGTn+feKYbABV10QAFI8Lj2413WidviQJmBRuPO9ETyc4oaGgKM
 Lu0XX/YTDzpEWnJkJbB/lTqyA62jP3AoatQXQC+ZEJ/D/QSVdyuRafag4
 drwUH/TXE4V9/1SV+6cd3gXUp763fCmKh2+qxV6hibWyRqJAX695MjNoy
 ZzHWgIi3anzG/41NkothlFejumJ4pAZBEcZG89kIwuRCCJWVyZCWTj9fs
 oqs3TpwMADQzOgMIr8Tz4SFwq/uz/j+Tb45+Thn56qFc6UE2VAmUv7iMZ
 OWM+wMcUHnntjtGIImZz9Tq16S837K23aPpR11ludEeQU11FXQo2zufsG Q==;
X-CSE-ConnectionGUID: TroeXXdLQV6EQwhFvRSQIw==
X-CSE-MsgGUID: ozvmp128T8K+iI3tDbF9uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85041166"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="85041166"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:54:33 -0800
X-CSE-ConnectionGUID: TaG62n4yRiamHiyBh9DK0g==
X-CSE-MsgGUID: QyyWzexOQcS2ZkATxOCyqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="256242164"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.249])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 06:54:30 -0800
Date: Wed, 4 Mar 2026 15:54:26 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Cc: John Harrison <John.C.Harrison@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/guc: fix corrupted copyright symbols in
 selftest files
Message-ID: <aahHos0xgN_qeeBi@ashyti-mobl2.lan>
References: <20260209112709.2551603-1-khorenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260209112709.2551603-1-khorenko@virtuozzo.com>
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

Hi Konstantin,

On Mon, Feb 09, 2026 at 12:27:09PM +0100, Konstantin Khorenko wrote:
> Replace broken UTF-8 sequences (Unicode replacement characters) with
> proper "©" text in copyright headers.
> 
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
