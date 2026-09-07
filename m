Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677B3C79F99
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Sep 2026 17:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DB210E00A;
	Mon,  7 Sep 2026 17:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6X29L1g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2F610E00A
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Sep 2026 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788800666; x=1820336666;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=AKcD8bdPTV/eS96y6XaDWLhowdb9htusKoPYGIyLxiw=;
 b=d6X29L1gFNh7ug/OpXq3MfffpgJge+eHK1u+8juulvRZTPCjQuwJfLaq
 THkLQHFsOqK6PMzBmKLNZ0UQb4CWZg0rIX3r0veevJF6WpRzbrdQm60We
 hPw2iBLhFQwIlYQjZMMjgxtlAvrEZLCSuyXH/txy1zcEl+BVbI6WfhRze
 4ftnTW1RdEMFNr7hi4JeOCUduy5jYsX3+8K2PLA+7MEP3q+OdKqwo2lqY
 QoNVIE4Wd6N3F+rCbKTSSusaKueG2ljY8F6SOORKd+jv1w0Cr/GZ67+E1
 H6jrXb0LkGmdemsKYdm32YDdz0H84i0XBW7QrBJIoUFCJD13eKbJudplJ Q==;
X-CSE-ConnectionGUID: wv2wRDQSQku0Pd62m/c5hw==
X-CSE-MsgGUID: CnN5P80ISdW0RIDsdwzCOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="111979684"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="111979684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:04:25 -0700
X-CSE-ConnectionGUID: 1u1zbFEES92NVPp15Zj8nQ==
X-CSE-MsgGUID: LGno/RBdTKS+qbX22dYoSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="276035363"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.229])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:04:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Xiao Lu <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 1/2] drm/dp/mst: recognize DP-to-HDMI PCON as virtual
 DPCD in DP-to-DP topology
In-Reply-To: <314b0dc2c8ddebfd995c83d0a04c715e.xiaolu.xie@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260907043922.1367673-1-xiaolu.xie@intel.com>
 <314b0dc2c8ddebfd995c83d0a04c715e.xiaolu.xie@intel.com>
Date: Mon, 07 Sep 2026 20:04:21 +0300
Message-ID: <3e77ec748184f3656146694db1cd6c07cfd4f07b@intel.com>
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

On Mon, 07 Sep 2026, Xiao Lu <xiaolu.xie@intel.com> wrote:
> Superseded by v5 series:
> <20260907044410.1368008-1-xiaolu.xie@intel.com>

Wait what.

That thread has versions 4 and 5, and this thread has version 5, and all
of them have been sent today.

Please slow down. These are involved patches, and nobody's had the time
to look into them properly.


BR,
Jani.


-- 
Jani Nikula, Intel
