Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC554C61DD3
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 16:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409010F687;
	Thu,  3 Sep 2026 16:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eobGIHCO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D62710F687
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788454771; x=1819990771;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=vhFsJ4HDrWwCJo6HavbrdWzGGyAIcEOh9uqFzvPpkTc=;
 b=eobGIHCO78FZtuKHJPGtZ6O5XwB22eoTf1ZjisJqzP9Ej7J6yYoCBoi9
 dlTEJZVuespGw1rK6YbonTdZnu40np+6MSmSEE75+Yh1ScobN+dX/P5Lo
 EqoJQrmaxEnKk1MFemNLYBPPcDweuUuEsG7XqG/6/gekC9ztJ1tHfCrV0
 dGq0GfuXKCw41ajz6pMgrf2jwEYlb4aDc9haqtoX4nnVxfLkqcEUaQxYO
 5BnhZEvemxBi8UUycHBeRLerad3a3/TARqqvWgHGYUcF8/c4yffWoccTW
 mJmjyAUaRpHuVUo40Q/mKfx9H3AbbScH5uHGvYrSR/l7F0oEdM1H9TcTj Q==;
X-CSE-ConnectionGUID: bOIAoZQ5Tv+pfo0GyppY0A==
X-CSE-MsgGUID: rIHyWOeLQwWIBCr5//acrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100104475"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100104475"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:59:30 -0700
X-CSE-ConnectionGUID: 7qr6k3W5RCKjZreSFOTIaQ==
X-CSE-MsgGUID: u3GvmDifT8qzh57MMbBChg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="273554929"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.170])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 09:59:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Varun Arora <arorasunan@gmail.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [i915] HP Victus 15-fa1xxx: eDP-1 link training failure after
 s2idle resume, PPS VDD wakeref warning
In-Reply-To: <CAMbcQ41KJqEWOPLETx8sjOoigUj67LukkDktD_CupSxmwJURMg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CAMbcQ41KJqEWOPLETx8sjOoigUj67LukkDktD_CupSxmwJURMg@mail.gmail.com>
Date: Thu, 03 Sep 2026 19:59:25 +0300
Message-ID: <207ad2c0d0aeeaeba7cda0a3cb9deee7cb14731c@intel.com>
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

On Thu, 03 Sep 2026, Varun Arora <arorasunan@gmail.com> wrote:
> I'm seeing a reproducible i915 eDP suspend/resume failure on an HP Victus
> 15-fa1xxx with an Intel Core i5-12450H and NVIDIA RTX 2050.

Please report a bug as described at [1].

BR,
Jani.




[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html



-- 
Jani Nikula, Intel
