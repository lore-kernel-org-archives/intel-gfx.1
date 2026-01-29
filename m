Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50E2D61013
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Jan 2026 13:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5105710E86A;
	Thu, 29 Jan 2026 13:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBNmR1bJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3034110E86A
 for <intel-gfx@lists.freedesktop.org>; Thu, 29 Jan 2026 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769692253; x=1801228253;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+WiYwNiX2gLMKvFK4IBZaeYSrQOVxaz6Z9CGJX2SexI=;
 b=BBNmR1bJvs3YiSPSQpu3z0tCS1N3ZXTMd9tiU0gRoO9fM+sIRlkg7e2i
 evck4HxWfcYrrBQKfaO3znZfj0J5XtHwNF4tG5VIOCCtfQs0GlVD6Altk
 efnA8zBF9WGRwGsI095wp/qHxoMuYEPJylZbGuKzYdMyPqUDle4DT3AUR
 ay/WLiYBwNSuTLPBxygv0ySp1TAgkzsb+LsyLVgSa+b0D8+sTw5gyLOrz
 Tk11yQ2RT7BX39SdBXzS9JUxULvFuG1PCicWqXiTv1S5dHqxEJAyXc07W
 Ec65SfHSiLs4XzIBqT1nZ19I/FzHqPzSWIQTXHK4wejCjb5tWRIfG4nIL g==;
X-CSE-ConnectionGUID: RqDOU64fS5KcVUm7IB36Jw==
X-CSE-MsgGUID: T/5UqMjgTQmoHSkSJMAXbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70825763"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70825763"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 05:10:52 -0800
X-CSE-ConnectionGUID: SBKx6e7VQfulVL3a4dlfhQ==
X-CSE-MsgGUID: J+FOzFObQ2qCAyw07TPHnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213536744"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.23])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 05:10:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti
 <andi.shyti@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, maxime.ripard@kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH v6 0/2] Miscellaneous fixes in drm code
In-Reply-To: <aXtFHm4Y94jf0YXd@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120154824.1864085-1-krzysztof.karas@intel.com>
 <aXtFHm4Y94jf0YXd@ashyti-mobl2.lan>
Date: Thu, 29 Jan 2026 15:10:44 +0200
Message-ID: <52e0096c310d346b23fa65b56837b4e0ecc09d58@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 29 Jan 2026, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi Krzysztof,
>
>> Krzysztof Karas (2):
>>   drm: Warn before division by 0 would occur
>>   drm: Avoid suspicious operations in drm_fb_dma_get_gem_addr()
>> 
>>  drivers/gpu/drm/drm_fb_dma_helper.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> merged to drm-intel-gt-next.

...but neither commit belongs in drm-intel-gt-next, they belong in
drm-misc-next!

Cc: drm-misc maintainers, how do you want to resolve this?

BR,
Jani.


-- 
Jani Nikula, Intel
