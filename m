Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A4BC433EF
	for <intel-gfx@archiver.kernel.org>; Fri,  7 Jan 2022 09:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B017511B82E;
	Fri,  7 Jan 2022 09:53:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5B11B82F
 for <intel-gfx@lists.freedesktop.org>; Fri,  7 Jan 2022 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641549198; x=1673085198;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=H1vGlzNEEJs0nlweLZdrAGreQEsa3tJBEMaPVSkX94w=;
 b=l7g1QouRgW4/9TpZnA3GrxqZJYl4+6U4GpQkFjxekJedPo+QGK//AnKM
 7ir5Y94YJOJObt7uK2xsgS5LkxY1GTtpjCIkDnLS/HgsjmUhnxGsaoBDx
 bySdmIxQ52dihUhXRgOloZbNvskYpEAAd/hLCPBXCGaaR7taD0jHsF+y2
 lFd3rMN7B/QywkRqTvAmMACZg+ulK9sj4w0S+Ub7lZWOTnyz0g4jq6NlQ
 J9av3T5QUDxCV4VNhW+0ZsXpZykL9p6hRjxek2wBM1CzJLxse6W/0e0U8
 48O2NboHg6I+xDQy/4Ex1l3GLftBYZ+XYIGF6s35+1/Rr8YLMpQxf85FJ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="240395180"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="240395180"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 01:53:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="527321915"
Received: from dgreerx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.24.206])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 01:53:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
In-Reply-To: <87czl3nb27.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220106230823.2791203-1-matthew.d.roper@intel.com>
 <87czl3nb27.fsf@intel.com>
Date: Fri, 07 Jan 2022 11:53:10 +0200
Message-ID: <87a6g7na7t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH 0/1] Start cleaning up register definitions
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 07 Jan 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Another early step should be splitting out the non-MMIO macros, for
> example the IOSF and PUNIT sideband stuff. They don't necessarily fall
> to the below categories.

Funny. I actually had a branch from a few months back splitting out PCI
config space, VGA, and VLV sideband registers. Added some commit
messages and sent it out. [1]

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/98597/

-- 
Jani Nikula, Intel Open Source Graphics Center
