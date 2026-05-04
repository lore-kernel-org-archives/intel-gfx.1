Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1621BCD3423
	for <intel-gfx@archiver.kernel.org>; Mon,  4 May 2026 09:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A1E10E0EE;
	Mon,  4 May 2026 09:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g//sEGC6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8324210E0EE
 for <intel-gfx@lists.freedesktop.org>; Mon,  4 May 2026 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777885369; x=1809421369;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YEAKfeHKZH0HnNFOznpFbulXQ7uyO/xl21TND3LzRh0=;
 b=g//sEGC6VOd6ZQJP9nDbm09+/VIA7NYALobGHGWQr0BFelDArqLshioU
 ztdJXlfJDltH8w1FlbudhJgn4j1IPQipIuF0EGZroTNzg2aZ3zjxT9VlZ
 6i3SBNnCsR5YPaT03pn9gER+HbuD/vRM8rpVixwNIUpLLC3vjPOAAAPpA
 zbKBW9X2fiVh/2Dg+UcQcqll8gA5CDcTU1mE/qJCDUDzTZ4/rUrs6UE7p
 PWQi6M04PSBmYIyufV3N7RtZfSIReVgG2TEOD32WipprmDqgImC8zftAQ
 Z2VsWoBB1btV+x8DgqyevwnRfzoIx1cNtZtweU/9kGM2a6le9yN4UkAE8 Q==;
X-CSE-ConnectionGUID: yYA2wnH9RSGVFcAstwWLjA==
X-CSE-MsgGUID: yJ/nZRT9Touk8uY2v8TBSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="101406726"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="101406726"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:02:49 -0700
X-CSE-ConnectionGUID: hZCpxrlUT4aWAPUHaLfhxQ==
X-CSE-MsgGUID: ktwlsYUcTpO64SlmPOvwCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="237239820"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.157])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:02:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/i915/bw: Extract platform-specific parameters
In-Reply-To: <87mrz5wmjn.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260408-separate-platform-from-diplay-ip-specific-bw-params-v1-0-23c53afa7db0@intel.com>
 <20260408-separate-platform-from-diplay-ip-specific-bw-params-v1-1-23c53afa7db0@intel.com>
 <5a2fefe3f3d7ee92d3cc1bca1ffe88370d54c822@intel.com>
 <20260409231256.GB6301@mdroper-desk1.amr.corp.intel.com>
 <87ik9yx4kx.fsf@intel.com>
 <20260410173355.GE6301@mdroper-desk1.amr.corp.intel.com>
 <87cy06wm89.fsf@intel.com> <87mrz5wmjn.fsf@intel.com>
Date: Mon, 04 May 2026 12:02:44 +0300
Message-ID: <412a9f41484be1b93d330b835622e46e34cec6cd@intel.com>
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

On Tue, 14 Apr 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> In general, if this function is called and a platform check is missing
> here, it should be considered a bug anyway, which should be caught early
> on during the initial enabling for the platform.
>
> So I'm inclined to raise a warning and let the null-pointer dereference
> happen.

Ack.

BR,
Jani.


-- 
Jani Nikula, Intel
