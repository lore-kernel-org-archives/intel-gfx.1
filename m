Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25ECCDB46B
	for <intel-gfx@archiver.kernel.org>; Mon, 22 Jun 2026 08:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8515410E538;
	Mon, 22 Jun 2026 08:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUMs0o12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82310E538
 for <intel-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 08:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782116864; x=1813652864;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oqOCe2vm5szuS8bk5kjYPZGSTFWtLBUZhVo5Haw/Ge8=;
 b=nUMs0o12lkZFt8EmLwLLMpoEAVZLUkQbTOvK3KvwLyc7Yqe4GulEQSau
 EMYmJm/MD3z4p6rEIa0/+6nP4Xy/Xwpx5k0aXVaFmJSj5z/CboIrw/Rzo
 CoTZmjbhyWTiEUx/15+hrcEC34f2uYtfEHVFYki0fkjC9i3woDeeg2jen
 Mwn6/YkN9b5RduGFVH2woW9n82cfYoAMHVSSOJeDychgw7BFFR5Idgbm/
 38e+6H4ODb+Mn/PTVWFgUN/+zIAfqdLMYhuGIkfk5PTaLd8ESl/3eSbYz
 jKqfZvjTgWBYVzq/rtrN//61RzU2ExjecMapSU5G50Uantb6655zPoHZv A==;
X-CSE-ConnectionGUID: Hp1otbJZQyuAd5OUwulLIA==
X-CSE-MsgGUID: Rq4VkYaxRNKtjCxhj/gKEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="100393297"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="100393297"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:27:43 -0700
X-CSE-ConnectionGUID: XpdEr1xOR2O3Ccj30TE8gA==
X-CSE-MsgGUID: dQdYHR7MSk+qQ4tR4gEgaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="251083835"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.82])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:27:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jakub Bystron <jb@elitecode.cz>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Cc: imre.deak@intel.com
Subject: Re: [REGRESSION] drm/i915: ThinkPad P1 Gen 7 fails to resume
 internal eDP panel after longer lid suspend
In-Reply-To: <eo3pb-09aTKunS-YR2uQS9u4BEDIihwSaGGMzdt-0qC1NvuQN_zVTMoL-r15j-w8vdlZJB4uHDdVXL0dJlJz8dwgt-A0cVe3KD3F8wnMuxg=@elitecode.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <eo3pb-09aTKunS-YR2uQS9u4BEDIihwSaGGMzdt-0qC1NvuQN_zVTMoL-r15j-w8vdlZJB4uHDdVXL0dJlJz8dwgt-A0cVe3KD3F8wnMuxg=@elitecode.cz>
Date: Mon, 22 Jun 2026 11:27:36 +0300
Message-ID: <19904ab8a890da1e7e1bfc3ff813aacad1cddd05@intel.com>
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

On Thu, 18 Jun 2026, Jakub Bystron <jb@elitecode.cz> wrote:
> I am seeing a suspend/resume regression with i915 on a Lenovo ThinkPad
> P1 Gen 7 for anything 7.0+. 6.18 LTS is fine.

Please try [1] or current drm-tip. If the problem persists, please file
a new bug report as described at [2].

Thanks,
Jani.

[1] https://lore.kernel.org/r/20260612172617.3427027-1-imre.deak@intel.com
[2] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
