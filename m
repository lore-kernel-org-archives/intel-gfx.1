Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FEAC46467
	for <intel-gfx@archiver.kernel.org>; Tue,  3 Jan 2023 10:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E18410E24D;
	Tue,  3 Jan 2023 10:14:17 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA0110E24C;
 Tue,  3 Jan 2023 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672740854; x=1704276854;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xw8JnN6F63QyJgk8X/TvL3FEwMeXYZpiYY8Fgt5s4O8=;
 b=T1XvZ881rr7Tl87C3QmVPgb0Wf9kipDy2n36JdRNf5IfX+rJi+egceBF
 iYUu3SVxIMU2KiRqDHWuoPSnoMrxeOeTK76CvR+3KdEqcc94F4XhCXuGR
 zEQuY5uVwx5QWkhML2LMmeT3f5cqcB/YP+HY+U4ru9du7qr5SSZ0ZYIal
 Kun8+ey4FsPZvhAGiS+uRMMOV+7QybJrmBJ5JzpjmlPEAoNpvBrNR+onp
 jVuMA6Xu2b5O7M6L0u8+FbyCDrL8qr2UR+khU5mWGMpqyboRh6qSFLTGW
 jx2zCTv3JWt3/ROJm82BuXOKNDUgfiK+maFosUIAqXXgcHbVGvn8+9s3C A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="322862910"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; d="scan'208";a="322862910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 02:14:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="632403047"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; d="scan'208";a="632403047"
Received: from jwilkin1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.24.132])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 02:14:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alexey Lukyachuk <skif@skif-web.ru>, Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <20230102165649.2b8e69e3@alexey-Swift-SF314-42>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221225184413.146916-1-skif@skif-web.ru>
 <20221225185507.149677-1-skif@skif-web.ru> <Y6sfvUJmrb73AeJh@intel.com>
 <20221227204003.6b0abe65@alexey-Swift-SF314-42>
 <20230102165649.2b8e69e3@alexey-Swift-SF314-42>
Date: Tue, 03 Jan 2023 12:14:02 +0200
Message-ID: <87a630ylg5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: dell wyse 3040 shutdown fix
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 02 Jan 2023, Alexey Lukyachuk <skif@skif-web.ru> wrote:
> Regarding to your question about fdo gitlab, I went to do it.

What's the URL for the issue?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
