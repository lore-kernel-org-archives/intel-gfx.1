Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E51DC433EF
	for <intel-gfx@archiver.kernel.org>; Wed,  5 Jan 2022 10:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB691898F3;
	Wed,  5 Jan 2022 10:29:30 +0000 (UTC)
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C27288FA1;
 Wed,  5 Jan 2022 10:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 8A1613F475;
 Wed,  5 Jan 2022 11:29:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Authentication-Results: pio-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GV7YmOrd_RHT; Wed,  5 Jan 2022 11:29:25 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 2B4AC3F3DC;
 Wed,  5 Jan 2022 11:29:24 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.198.151.51])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 235A536034E;
 Wed,  5 Jan 2022 11:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1641378564; bh=KcVRpkTHWpVYrDqtxDa1HuMcu+PXVjBTzVKo09rNA90=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GDo+gvhYVmO3dQor8ZLZdf4h4kf1fBVk39oAeX4BH22DkPipRCSiYweuS3+NSLWne
 DawlUZPh6WAq7/uNjZJ1EldYbPBaJb0+jjht71yGfwlS5EQa4Gag/WUIYPoO3OJM81
 EN29jfNXjN8wswok0zDP+d1YOGKMx8kWf9x1I9RQ=
Message-ID: <85892b35-d0c9-9092-c47f-f2b5af8ad80b@shipmail.org>
Date: Wed, 5 Jan 2022 11:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20211215110746.865-1-matthew.auld@intel.com>
 <20211215110746.865-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20211215110746.865-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: clean up
 shrinker_release_pages
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi, Matthew

On 12/15/21 12:07, Matthew Auld wrote:
> Add some proper flags for the different modes, and shorten the name to
> something more snappy.
>
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


