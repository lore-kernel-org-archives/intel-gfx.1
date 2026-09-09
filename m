Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB32AC79FB6
	for <intel-gfx@archiver.kernel.org>; Wed,  9 Sep 2026 12:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539AD10E1AA;
	Wed,  9 Sep 2026 12:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+zEYPfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B307410E0DE
 for <intel-gfx@lists.freedesktop.org>; Wed,  9 Sep 2026 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788956623; x=1820492623;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=EGMPl1/azotDDmDi6hCyyu3mt6FZC4wNffQGhSdza78=;
 b=k+zEYPfHJQ1UdcQC/RVfvGxqGrHs/hFTpstFIk5Qm2/E+SnQ1YieITks
 GXknTHaxJ5RbPVQb6uArxm5Et28HSQvjy+HOrBRbfx4Azpd2dOoWerHCz
 /3kwR7EeKU5dPk+OCmGW9Y2e/McG3fzz5lxXGtIz88dF0ZXyY/5zFhpg3
 oPJLK7+3YoeBFoeNqMxztxdvezWrLmVbZkg1Z9FZ6yTyRrgDL4hN+wLzg
 gSCfHPCtgtvLJLRiLp/L4kExY6oc7Qbs3O0Ruv4WSLinHhuRUT4Qi3cSQ
 7W5ILGq9zdYgbOQW6voP/Y+L8W4d9SyYy/aClVDqqnU/Pj4K+cf0eNz/6 g==;
X-CSE-ConnectionGUID: SQcZ69eCQzGumklMZrLtVQ==
X-CSE-MsgGUID: j6I2tfYaTbKyyaq/R1RoLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88321192"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="88321192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:23:43 -0700
X-CSE-ConnectionGUID: QrPR0YoqQPyCsQsmqjqahQ==
X-CSE-MsgGUID: oo2x3llGT+6YV+VUrX0+xA==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:23:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Fredrik Nicol <fredrik.nicol@strategic9.se>,
 intel-gfx@lists.freedesktop.org
Subject: Re: Panther Lake (b082) eDP tearing tied to Panel
 Replay/selective-fetch,  Anapass T-Con (OUI ba:41:59)
In-Reply-To: <CAE3tsCV8SS0Tb51Wj=nuh9pJ=fLMwc=4qswFec3_dw7dHT6D5Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CAE3tsCV8SS0Tb51Wj=nuh9pJ=fLMwc=4qswFec3_dw7dHT6D5Q@mail.gmail.com>
Date: Wed, 09 Sep 2026 15:23:40 +0300
Message-ID: <2c2360336358fb7dea7c2b7ddf76df5d5805adb8@intel.com>
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

On Wed, 26 Aug 2026, Fredrik Nicol <fredrik.nicol@strategic9.se> wrote:
> I'm running into a persistent display bug on a Panther Lake handheld
> (OneXPlayer 3, GPU device ID 8086:b082) that I've traced fairly deep into
> the xe driver's Panel Replay/selective-fetch path, and I wanted to get this
> in front of someone who can actually act on it rather than let it sit
> undocumented. I'm a developer, not a kernel contributor, so apologies if
> some of this is presented a bit sideways from how you'd normally see a bug
> report, but I've tried to keep everything here verifiable.

Sorry for the delayed response. Please file a bug as described at [1].

Thanks,
Jani.

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
